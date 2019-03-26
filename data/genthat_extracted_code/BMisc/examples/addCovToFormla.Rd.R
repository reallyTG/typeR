library(BMisc)


### Name: addCovToFormla
### Title: addCovToFormla
### Aliases: addCovToFormla

### ** Examples

formla <- y ~ x 
addCovToFormla(list("w","z"), formla)

formla <- ~x
addCovToFormla("z", formla)




