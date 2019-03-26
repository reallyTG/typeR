library(unmarked)


### Name: unmarkedFrameDS
### Title: Organize data for the distance sampling model of Royle et al.
###   (2004) fit by distsamp
### Aliases: unmarkedFrameDS

### ** Examples


# Fake data
R <- 4 # number of sites
J <- 3 # number of distance classes

db <- c(0, 10, 20, 30) # distance break points

y <- matrix(c(
   5,4,3, # 5 detections in 0-10 distance class at this transect
   0,0,0,
   2,1,1,
   1,1,0), nrow=R, ncol=J, byrow=TRUE)
y

site.covs <- data.frame(x1=1:4, x2=factor(c('A','B','A','B')))
site.covs

umf <- unmarkedFrameDS(y=y, siteCovs=site.covs, dist.breaks=db, survey="point",
    unitsIn="m")            # organize data
umf                         # look at data
summary(umf)                # summarize
fm <- distsamp(~1 ~1, umf)  # fit a model





