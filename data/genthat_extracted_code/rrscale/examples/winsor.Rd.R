library(rrscale)


### Name: winsor
### Title: Winsorizes the data
### Aliases: winsor

### ** Examples

Y <- rlnorm(10)%*%t(rlnorm(10))
Yw <- winsor(Y,1E-2)



