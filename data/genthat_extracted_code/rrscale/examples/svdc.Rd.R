library(rrscale)


### Name: svdc
### Title: The completed SVD
### Aliases: svdc

### ** Examples

Y <- rnorm(10)%*%t(rnorm(10))
Y[1,1] <- NA
svdc.out <- svdc(Y)



