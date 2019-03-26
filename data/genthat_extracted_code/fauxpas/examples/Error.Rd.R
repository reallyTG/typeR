library(fauxpas)


### Name: Error
### Title: Error class
### Aliases: Error
### Keywords: datasets

### ** Examples

Error$new()
# reset behavior
(z <- Error$new())
z$set_behavior("warning")
z

if (requireNamespace("crul")) {
 library("crul")
 res <- HttpClient$new("https://httpbin.org/status/418")$get()

 # stop
 (x <- Error$new(behavior = "stop"))
 ## Not run: x$do(res)

 # warn
 (x <- Error$new(behavior = "warning"))
 x$do(res)

 # do vs. do_verbose
 x <- HTTPRequestURITooLong$new(behavior = "stop")
 res <- HttpClient$new("https://httpbin.org/status/414")$get()
 ## Not run: 
##D  http414(res)
##D  ## with template
##D  http414(res, message_template = "{{status}}\n  --> {{reason}}")
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)

 # service unavailable
 x <- HTTPServiceUnavailable$new(behavior = "stop")
 res <- HttpClient$new("https://httpbin.org/status/503")$get()
 ## Not run: 
##D  x$do(res)
##D  x$do_verbose(res)
##D  
## End(Not run)

 # message template
 y <- Error$new(message_template = "{{reason}} ............ {{status}}")
 res <- HttpClient$new("https://httpbin.org/status/418")$get()
 ## Not run: 
##D  y$do(res)
##D  
## End(Not run)

 yy <- Error$new(message_template = "{{status}}\n  --> {{reason}}")
 yy$message_template
 ## Not run: 
##D  yy$do(res)
##D  
## End(Not run)

 ## with verbose message
 library(crul)
 res <- HttpClient$new("https://httpbin.org/status/401")$get()
 yy <- HTTPUnauthorized$new()
 zz <- HTTPUnauthorized$new(
   message_template = "HTTP({{status}}): {{reason}}\n  {{message}}"
 )
 yy$message_template; zz$message_template
 ## Not run: 
##D  yy$do(res)
##D  zz$do(res)
##D  yy$do_verbose(res)
##D  zz$do_verbose(res)
##D  
## End(Not run)

 yy <- Error$new(
   message_template = "HTTP({{status}}): {{reason}}\n  {{message}}"
 )
 yy$message_template
 ## Not run: yy$do(res)
}



