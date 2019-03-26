library(SCCS)


### Name: smoothagesccs
### Title: Spline-based semiparametric SCCS, smooth age
### Aliases: smoothagesccs
### Keywords: Splines Semi-parametric

### ** Examples


# Fit the SCCS model with smooth age effect to the itp data and plot age effect.  

itp.mod <- smoothagesccs(indiv=case, astart=sta,aend=end, aevent=itp,
                           adrug=mmr, aedrug=mmr+42, expogrp=c(0,15,29), sp=2800,
                           data=itpdat)

itp.mod

plot(itp.mod)




