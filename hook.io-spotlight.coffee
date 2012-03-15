request = require 'request'
querystring = require 'querystring'

cb = console.log

query = "I like indie music"
#console.log " http://spotlight.dbpedia.org/rest/annotate?" + querystring.stringify({confidence:-1,"support":-1,text:query})

opts =
    uri: "http://spotlight.dbpedia.org/rest/annotate?" + querystring.stringify({text:query,confidence:0.0,support:-1})
    headers: {"Accept": 'application/json'}
    encoding: 'utf8'
request.get opts, (err, res, body) ->
    if res?.statusCode is 200
#        cb? "Response: #{body}"
        cb? null, JSON.parse body
    else
        cb? "Something went wrong"
        cb? [err, res, body]

