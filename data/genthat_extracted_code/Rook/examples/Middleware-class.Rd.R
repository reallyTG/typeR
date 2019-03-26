library(Rook)


### Name: Middleware-class
### Title: Class 'Middleware'
### Aliases: Middleware-class Middleware
### Keywords: classes

### ** Examples

# Middleware applications are typically instantiated in the argument list of
# Builder$new(), but here is stand-alone example.
# 
# Once your browser loads the app, you will see something like this in
# your location bar: http://127.0.0.1:28649/custom/middle. Add '/foo'
# onto the end of that and reload.

setRefClass(
    'FooBar',
    contains = 'Middleware',
    methods = list(
        initialize = function(...){
            # app to defer to.
            callSuper(app=App$new(function(env){
                res <- Response$new()
                res$write("<h1>I'm the deferred app.</h1>")
                res$finish()
            }))
        },
        call = function(env){
            req <- Request$new(env)
            res <- Response$new()
            if (length(grep('foo',req$path_info()))){
                res$write("<h1>I'm the middleware app.</h1>")        
                return(res$finish())
            } else {
                app$call(env)
            }
        }
    )
)
s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
s$add(name="middle",app=getRefClass('FooBar')$new())
## Not run: 
##D s$browse('middle') # Opens a browser window to the app.
## End(Not run)
s$remove(all=TRUE)
rm(s)



