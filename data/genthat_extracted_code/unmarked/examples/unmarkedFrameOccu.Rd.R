library(unmarked)


### Name: unmarkedFrameOccu
### Title: Organize data for the single season occupancy models fit by occu
###   and occuRN
### Aliases: unmarkedFrameOccu

### ** Examples


# Fake data
R <- 4 # number of sites
J <- 3 # number of visits
y <- matrix(c(
   1,1,0,
   0,0,0,
   1,1,1,
   1,0,1), nrow=R, ncol=J, byrow=TRUE)
y

site.covs <- data.frame(x1=1:4, x2=factor(c('A','B','A','B')))
site.covs

obs.covs <- list(
   x3 = matrix(c(
      -1,0,1,
      -2,0,0,
      -3,1,0,
      0,0,0), nrow=R, ncol=J, byrow=TRUE),
   x4 = matrix(c(
      'a','b','c',
      'd','b','a',
      'a','a','c',
      'a','b','a'), nrow=R, ncol=J, byrow=TRUE))
obs.covs

umf <- unmarkedFrameOccu(y=y, siteCovs=site.covs, 
    obsCovs=obs.covs)   # organize data
umf                     # look at data
summary(umf)            # summarize      
fm <- occu(~1 ~1, umf)  # fit a model





