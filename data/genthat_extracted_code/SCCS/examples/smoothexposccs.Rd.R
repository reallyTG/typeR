library(SCCS)


### Name: smoothexposccs
### Title: Spline-based semiparametric SCCS, smooth exposure
### Aliases: smoothexposccs
### Keywords: Splines Semi-parametric SCCS

### ** Examples


library(SCCS)

# Fit smooth exposure SCCS to MMR vaccine and itp 

 itp.mod1 <- smoothexposccs(sp=10, indiv=case, astart=sta, aend=end,
                           aevent=itp, adrug=mmr, aedrug=mmr+42,
                           agegrp=c(427, 488, 549, 610, 671), data=itpdat)
 
 itp.mod1
 
 plot(itp.mod1)
 



