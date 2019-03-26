library(regtools)


### Name: lmac,makeNA,coef.lmac,vcov.lmac,pcac,loglinac,tbltofakedf
### Title: Available Cases Method for Missing Data
### Aliases: lmac pcac coef.lmac vcov.lmac loglinac tbltofakedf makeNA

### ** Examples

n <- 25000
w <- matrix(rnorm(2*n),ncol=2)  # x and epsilon
x <- w[,1]
y <- x + w[,2]
# insert some missing values
nmiss <- round(0.1*n)
x[sample(1:n,nmiss)] <- NA
nmiss <- round(0.2*n)
y[sample(1:n,nmiss)] <- NA
acout <- lmac(cbind(x,y))
coef(acout)  # should be near pop. values 0 and 1



