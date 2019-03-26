library(SCCS)


### Name: nonparasccs
### Title: Spline-based non parametric SCCS method
### Aliases: nonparasccs
### Keywords: Splines

### ** Examples




# ITP and MMR data 

  ## No test: 
itp.mod <- nonparasccs(indiv=case, astart=sta, aend=end,
                         aevent=itp, adrug=mmr, aedrug=mmr+42, sp1=28000, sp2=1200,
                         data=itpdat)
## End(No test)

  ## No test: 
itp.mod
## End(No test)
  
# Plot the exposure and age related relative incidence functions

 ## No test: 
 plot(itp.mod)
## End(No test)
  



