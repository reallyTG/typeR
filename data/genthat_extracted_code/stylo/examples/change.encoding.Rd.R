library(stylo)


### Name: change.encoding
### Title: Change character encoding
### Aliases: change.encoding

### ** Examples
## Not run: 
##D # To replace the old versions with the newly encoded, but retain them 
##D # in another folder:
##D change.encoding = function(corpus.dir = "~/corpora/example/", 
##D                            from = "ASCII", to = "utf-8")
##D 
##D # To place the new version in another folder called "utf8/":
##D change.encoding = function(corpus.dir = "~/corpora/example/",
##D                            from = "ASCII", 
##D                            to = "utf-8", 
##D                            output.dir = "utf8/")
##D                            
##D # To simply replace the old version:
##D change.encoding = function(corpus.dir = "~/corpora/example/", 
##D                            from = "ASCII", 
##D                            to = "utf-8",
##D                            keep.original = FALSE)
## End(Not run)



