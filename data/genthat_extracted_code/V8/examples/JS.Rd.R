library(V8)


### Name: JS
### Title: Mark character strings as literal JavaScript code
### Aliases: JS

### ** Examples

ct <- v8()
ct$eval("1+1")
ct$eval(JS("1+1"))
ct$assign("test", JS("2+3"))
ct$get("test")



