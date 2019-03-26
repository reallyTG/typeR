library(rv)


### Name: rvdiscrete
### Title: Generate Random Vectors from a Discrete Sampling Model
### Aliases: rvdiscrete
### Keywords: classes

### ** Examples

## Not run: 
##D 
##D   # 8 people draw a number each from 1..10 with replacement.
##D   # What is the probability that the highest number of the eight is "10"?
##D   u <- rvdiscrete(n=8, x=1:10) # 8 iid variables from the discrete uniform 1:10.
##D   Pr(max(u)==10)
##D   # What is the probability that the person with the 3rd smallest number
##D   # has at least "3"?
##D   s <- sort(u) # order distribution
##D   Pr(s[3]>=3)
##D   
## End(Not run)




