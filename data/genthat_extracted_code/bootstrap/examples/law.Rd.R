library(bootstrap)


### Name: law
### Title: Law school data from Efron and Tibshirani
### Aliases: law
### Keywords: datasets

### ** Examples

str(law)
if(interactive())par(ask=TRUE)
plot(law)
theta <- function(ind) cor(law[ind,1], law[ind,2])
theta(1:15) # sample estimate
law.boot <- bootstrap(1:15, 2000, theta)
sd(law.boot$thetastar) # bootstrap standard error
hist(law.boot$thetastar)
# bootstrap t confidence limits for the correlation coefficient:
theta <- function(ind) cor(law[ind,1], law[ind,2])
boott(1:15, theta, VS=FALSE)$confpoints
boott(1:15, theta, VS=TRUE)$confpoints
# Observe the difference! See page 162 of the book. 
# abcnon(as.matrix(law), function(p,x) cov.wt(x, p, cor=TRUE)$cor[1,2]  )$limits
# The above cannot be used, as the resampling vector can take negative values! 



