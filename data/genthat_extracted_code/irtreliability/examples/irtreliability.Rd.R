library(irtreliability)


### Name: irtreliability
### Title: Marginal and Test Reliability Coefficients with Item Response
###   Theory
### Aliases: irtreliability

### ** Examples

#Generate 2-PL data
set.seed(14)
akX <- runif(15, 0.5, 2)
bkX <- rnorm(15)
data2pl <- matrix(0, nrow = 1000, ncol = 15)

for(i in 1:1000){
	ability <- rnorm(1)
	data2pl[i,1:15] <- (1 / (1 + exp(-akX *(ability - bkX)))) > runif(15)
}

#Estimate the 2-PL IRT model with package mirt
library(mirt)
sim2pl <- mirt(data.frame(data2pl), 1, "gpcm", SE = TRUE)
mrc2pl <- irtreliability(sim2pl, "GPCM", rep(2, 15), relcoef = "mrc")
trc2pl <- irtreliability(sim2pl, "GPCM", rep(2, 15))



