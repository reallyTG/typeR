library(Rook)


### Name: Response-class
### Title: Class 'Response'
### Aliases: Response-class Response
### Keywords: classes

### ** Examples

s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
s$add(name="response",
    app=function(env){
        req <- Request$new(env)
        res <- Response$new()
        res$write('hello')
        res$finish()
    }
)
## Not run: 
##D s$browse('response') # Opens a browser window to the app.
## End(Not run)
s$remove(all=TRUE)
rm(s)



