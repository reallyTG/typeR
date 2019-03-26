library(RCAL)


### Name: glm.regu.path
### Title: Regularied M-estimation for fitting generalized linear models
###   along a regularization path
### Aliases: glm.regu.path

### ** Examples

## No test: 
data(simu.data)
n <- dim(simu.data)[1]
p <- dim(simu.data)[2]-2

y <- simu.data[,1]
tr <- simu.data[,2]
x <- simu.data[,2+1:p]
x <- scale(x)

### Example 1: linear regression
out.rgaus.path <- glm.regu.path(rho.seq=c(.01, .02, .05, .1, .2, .5), y=y[tr==1], x=x[tr==1,], 
                                loss="gaus")

# the estimated intercept and coefficients; the first 10 are shown
out.rgaus.path$bet.all[1:10,]

### Example 2: logistic regression using likelihood loss
out.rml.path <- glm.regu.path(rho.seq=c(.002, .005, .01, .02, .05, .1), y=tr, x=x, loss="ml")
out.rml.path$bet.all[1:10,]

### Example 3: logistic regression using calibration loss
out.rcal.path <- glm.regu.path(rho.seq=c(.005, .01, .02, .05, .1, .2), y=tr, x=x, loss="cal")
out.rcal.path$bet.all[1:10,]
## End(No test)




