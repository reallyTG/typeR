library(sdcTarget)


### Name: show,sdcHashClass-method
### Title: Show Method For 'sdcHashClass' Objects
### Aliases: show,sdcHashClass-method summary,sdcHashClass-method

### ** Examples

show(new("sdcHashClass"))
summary(new("sdcHashClass"))
my.X <- data.frame(matrix(ifelse(runif(500)>.5, TRUE, FALSE), ncol = 5))
my.hc <- new("sdcHashClass", X = my.X)
summary(my.hc)



