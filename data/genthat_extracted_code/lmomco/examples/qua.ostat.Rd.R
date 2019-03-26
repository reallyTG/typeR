library(lmomco)


### Name: qua.ostat
### Title: Compute the Quantiles of the Distribution of an Order Statistic
### Aliases: qua.ostat
### Keywords: order statistics (misc.) order statistics (quantile function
###   of)

### ** Examples

gpa <- vec2par(c(100,500,0.5),type='gpa')
n <- 20   # the sample size
j <- 15   # the 15th order statistic
F <- 0.99 # the 99th percentile
theoOstat <- qua.ostat(F,j,n,gpa)
## Not run: 
##D # Let us test this value against a brute force estimate.
##D Jth <- vector(mode = "numeric")
##D for(i in seq(1,10000)) {
##D   Q <- sort(rlmomco(n,gpa))
##D   Jth[i] <- Q[j]
##D }
##D bruteOstat <- quantile(Jth,F) # estimate by built-in function
##D theoOstat  <- signif(theoOstat,digits=5)
##D bruteOstat <- signif(bruteOstat,digits=5)
##D cat(c("Theoretical=",theoOstat,"  Simulated=",bruteOstat,"\n"))
## End(Not run)



