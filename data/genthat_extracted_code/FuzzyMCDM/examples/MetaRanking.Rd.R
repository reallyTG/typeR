library(FuzzyMCDM)


### Name: MetaRanking
### Title: Implementation of MetaRanking function for Multi-Criteria
###   Decision Making Problems.
### Aliases: MetaRanking

### ** Examples


 d <- matrix(c(0.68,0.4,0.6,0.2,0.4,1.44,0.67,0.9,0.45,0.6,2.2,
 0.95,1.2,0.7,0.8,18,8,8,25,6,21,11.5,11.5,32.5,9,24,15,15,40,
 12,9,0.66,0.66,0,0,10,2.33,2.33,0.66,0.33,10,4.33,4.33,2.33,
 1.66,5,1.33,1.33,5.66,1,7,3,3,7.66,2,8.66,5,5,9.33,3.66,2.33,
 0.66,0.33,1.33,1.66,4.33,2,1.33,3,2.66,6.33,3.66,3,5,4.33),
 nrow=5,ncol=15)
 w <- c(0.189,0.214,0.243,0.397,0.432,0.462,0.065,0.078,0.096,
 0.068,0.084,0.106,0.174,0.190,0.207)
 cb <- c('min','max','max','min','min')
 lambda <- 0.5
 v <- 0.5
 MetaRanking(d,w,cb,lambda,v)



