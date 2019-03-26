library(elastic)


### Name: connect
### Title: Set connection details to an Elasticsearch engine.
### Aliases: connect connection

### ** Examples

## Not run: 
##D # the default is set to 127.0.0.1 (i.e., localhost) and port 9200
##D connect()
##D 
##D # set a different host
##D # connect(es_host = '162.243.152.53')
##D # => http://162.243.152.53:9200
##D 
##D # set a different port
##D # connect(es_port = 8000)
##D # => http://localhost:8000
##D 
##D # set a different context path
##D # connect(es_path = 'foo_bar')
##D # => http://localhost:9200/foo_bar
##D 
##D # set to https
##D # connect(es_transport_schema = 'https')
##D # => https://localhost:9200
##D 
##D # See connection details
##D connection()
##D 
##D # set headers
##D connect(headers = list(a = 5))
##D ## or
##D connect(headers = add_headers(a = 5))
## End(Not run)



