library(sdcTarget)


### Name: sdcHashClass-class
### Title: S4 Hash Class
### Aliases: initialize,sdcHashClass-method sdcHashClass-class

### ** Examples

new("sdcHashClass")
new("sdcHashClass")
my.X <- data.frame(matrix(ifelse(runif(5000)>.5, TRUE, FALSE), ncol = 50))
new("sdcHashClass", X = my.X)
new("sdcHashClass", X = my.X, na.recode = FALSE, which = 2:4,
    forwardHashing = TRUE)



