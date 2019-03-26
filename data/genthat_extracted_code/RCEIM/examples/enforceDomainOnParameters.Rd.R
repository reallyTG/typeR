library(RCEIM)


### Name: enforceDomainOnParameters
### Title: Enforce domain boundaries
### Aliases: enforceDomainOnParameters
### Keywords: misc

### ** Examples

# Creates a random set of parameters in an interval larger than a certain domain
# and apply the enforceDomainOnParameters function and represent graphically
# the parameters before and after the function.
dev.new()
paramArr <- matrix((runif(100)-0.5)/0.5*13, nrow=50)
domain <- matrix(c(-10, -10, 10, 10), ncol=2)
newParamArr <- enforceDomainOnParameters(paramArr, domain)
plot(paramArr[,1], paramArr[,2], xlab="x", ylab="y", main="black: input\n red: output")
points(newParamArr[,1], newParamArr[,2], col="red", pch=19, cex=0.7)



