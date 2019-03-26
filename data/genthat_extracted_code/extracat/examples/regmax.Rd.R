library(extracat)


### Name: regmax
### Title: Regular maximality
### Aliases: regmin regmax

### ** Examples

x <- replicate(20,rnorm(20))
cx <- abs(cor(x))
regmax(x)
regmin(x)

diag(cx) = runif(20)
regmax(x)
regmin(x)




