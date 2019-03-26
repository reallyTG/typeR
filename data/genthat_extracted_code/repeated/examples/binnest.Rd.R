library(repeated)


### Name: binnest
### Title: Binary Random Effects Models with Two Levels of Nesting
### Aliases: binnest
### Keywords: models

### ** Examples


#y <- rbind(matrix(rbinom(20,1,0.6), ncol=4),
#	matrix(rbinom(20,1,0.4), ncol=4))
y <- matrix(c(1,1,0,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,0,0,1,0,1,1,0,1,0,
	1,1,1,1,1,1,1,1,0,1,1,0),nrow=10,ncol=4,byrow=TRUE)
resp <- restovec(y, nest=1:4, times=FALSE)
ccov <- tcctomat(c(rep(0,5),rep(1,5)), name="treatment")
reps <- rmna(resp, ccov=ccov)

# two random effects
binnest(reps, mu=~treatment, preg=c(1,0), pre1=1, pre2=1)

# first level random effect only
binnest(reps, mu=~treatment, preg=c(1,-1), pre1=1)

# second level random effect only
binnest(reps, mu=~treatment, preg=c(1,-1), pre2=1)




