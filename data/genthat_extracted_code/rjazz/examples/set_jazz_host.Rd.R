library(rjazz)


### Name: set_jazz_host
### Title: Set the name of the Jazz server to avoid passing it in all
###   function calls
### Aliases: set_jazz_host

### ** Examples

## Not run: 
##D set_jazz_host('127.0.0.1:8888')
##D page <- '<html>\n<body>\n<br/>Hello world!\n</body>\n</html>'
##D create_web_resource('my_test',
##D                     '/my_test/hello.html',
##D                     type_const[['BLOCKTYPE_RAW_MIME_HTML']],
##D                     page)
##D # See http://127.0.0.1:8888/my_test/hello.html with a browser.
##D 
##D list_web_sources()
##D delete_web_source('my_test')
## End(Not run)



