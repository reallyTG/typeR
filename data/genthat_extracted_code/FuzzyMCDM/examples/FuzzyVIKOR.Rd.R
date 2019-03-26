library(FuzzyMCDM)


### Name: FuzzyVIKOR
### Title: Implementation of Fuzzy VIKOR Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: FuzzyVIKOR

### ** Examples


 d <- matrix(c(38,20,24.58,44.54,33.33,33.86,40.01,21.06,25.87,46.89,33.33,33.86,48,24,
 29.75,56.27,43.33,42.32,3.26,2.57,2.82,2.46,2.25,2.47,4.08,2.87,2.97,2.73,2.5,2.74,4.08,
 2.87,2.97,2.73,2.62,2.85,43,6,38,60,6,6,47,6,42,62,6,6,48,6,50,68,6,6,10,10,1,0,2,3,10,
 10,1,0,2,3,10,10,1,0,2,3),nrow=6,ncol=12)
 w <- c(1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12,1/12)
 cb <- c('min','max','min','min')
 v <- 0.625
 FuzzyVIKOR(d,w,cb,v)



