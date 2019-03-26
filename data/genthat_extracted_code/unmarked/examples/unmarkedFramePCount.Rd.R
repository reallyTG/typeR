library(unmarked)


### Name: unmarkedFramePCount
### Title: Organize data for the N-mixture model fit by pcount
### Aliases: unmarkedFramePCount

### ** Examples


# Fake data
R <- 4 # number of sites
J <- 3 # number of visits
y <- matrix(c(
   1,2,0,
   0,0,0,
   1,1,1,
   2,2,1), nrow=R, ncol=J, byrow=TRUE)
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

umf <- unmarkedFramePCount(y=y, siteCovs=site.covs, 
    obsCovs=obs.covs)          # organize data
umf                            # take a l
summary(umf)                   # summarize data
fm <- pcount(~1 ~1, umf, K=10) # fit a model
      




