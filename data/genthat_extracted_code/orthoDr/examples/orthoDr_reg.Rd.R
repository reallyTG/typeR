library(orthoDr)


### Name: orthoDr_reg
### Title: orthoDr_reg
### Aliases: orthoDr_reg

### ** Examples

# generate some regression data
set.seed(1)
N = 100; P = 4; dataX = matrix(rnorm(N*P), N, P)
Y = -1 + dataX[,1] + rnorm(N)
# fit the semi-sir model
orthoDr_reg(dataX, Y, ndr = 1, method = "sir")
# fit the semi-phd model
Y = -1 + dataX[,1]^2 + rnorm(N)
orthoDr_reg(dataX, Y, ndr = 1, method = "phd")



