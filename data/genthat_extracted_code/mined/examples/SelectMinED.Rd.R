library(mined)


### Name: SelectMinED
### Title: Select Minimum Energy Design samples from a candidate set
### Aliases: SelectMinED
### Keywords: Experimental Design

### ** Examples

cand <- matrix(runif(10000, min = -4, max = 4), ncol = 1)
candlf <- log(dnorm(cand))
res <- mined::SelectMinED(cand, as.vector(candlf), 150, 1.0, 2.0)
print(res)
par(mfrow=c(1,2))
hist(cand)
hist(res$points)



