library(bootstrap)


### Name: scor
### Title: Open/Closed Book Examination Data
### Aliases: scor
### Keywords: datasets

### ** Examples

str(scor) 
if(interactive())par(ask=TRUE)
plot(scor) 
# The parameter of interest (theta) is the fraction of variance explained 
# by the first principal component.
# For principal components analysis svd is better numerically than 
# eigen-decomposistion, but for bootstrapping the latter is _much_ faster.
theta <- function(ind) {
   vals <- eigen(var(scor[ind,]), symmetric=TRUE, only.values=TRUE)$values
   vals[1] / sum(vals) }
scor.boot <- bootstrap(1:88, 500, theta)
sd(scor.boot$thetastar) # bootstrap standard error
hist(scor.boot$thetastar)
abline(v=theta(1:88), col="red2")
abline(v=mean(scor.boot$thetastar), col="blue")



