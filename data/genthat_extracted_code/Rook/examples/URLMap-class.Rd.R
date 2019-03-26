library(Rook)


### Name: URLMap-class
### Title: Class 'URLMap'
### Aliases: URLMap-class URLMap
### Keywords: classes

### ** Examples

s <- Rhttpd$new()
s$add(
    name="pingpong",
    app=Rook::URLMap$new(
        '/ping' = function(env){
            req <- Rook::Request$new(env)
            res <- Rook::Response$new()
            res$write(sprintf('<h1><a href="%s">Pong</a></h1>',req$to_url("/pong")))
            res$finish()
        },
        '/pong' = function(env){
            req <- Rook::Request$new(env)
            res <- Rook::Response$new()
            res$write(sprintf('<h1><a href="%s">Ping</a></h1>',req$to_url("/ping")))
            res$finish()
        },
        '/?' = function(env){
            req <- Rook::Request$new(env)
            res <- Rook::Response$new()
            res$redirect(req$to_url('/pong'))
            res$finish()
        }
    )
)
## Not run: 
##D s$start(quiet=TRUE)
##D s$browse('pingpong')
## End(Not run)
s$remove('pingpong')
## Not run: 
##D s$stop()
## End(Not run)
rm(s)



