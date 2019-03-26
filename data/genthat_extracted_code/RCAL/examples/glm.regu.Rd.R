library(RCAL)


### Name: glm.regu
### Title: Regularied M-estimation for fitting generalized linear models
###   with a fixed tuning parameter
### Aliases: glm.regu

### ** Examples

data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

### Example 1: linear regression
# rhos should be a vector of length p, even though a constant vector
out.rgaus <- glm.regu(y[tr==1], x[tr==1,], rhos=rep(.05,p), loss="gaus")

# the intercept
out.rgaus$inter

# the estimated coefficients and generalized signs; the first 10 are shown
cbind(out.rgaus$bet, out.rgaus$tau)[1:10,]

# the number of nonzero coefficients 
out.rgaus$nz

### Example 2: logistic regression using likelihood loss
out.rml <- glm.regu(tr, x, rhos=rep(.01,p), loss="ml")
out.rml$inter
cbind(out.rml$bet, out.rml$tau)[1:10,]
out.rml$nz

### Example 3: logistic regression using calibration loss
out.rcal <- glm.regu(tr, x, rhos=rep(.05,p), loss="cal")
out.rcal$inter
cbind(out.rcal$bet, out.rcal$tau)[1:10,]
out.rcal$nz




