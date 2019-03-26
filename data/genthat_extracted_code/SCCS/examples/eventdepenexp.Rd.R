library(SCCS)


### Name: eventdepenexp
### Title: SCCS with event-dependent exposure
### Aliases: eventdepenexp
### Keywords: Event dependent exposures

### ** Examples

library(SCCS)

# Analysis of rotavirus vaccination and intussusception data
# Model 1: Three doses of the same vaccine exposure OPV (OPV, OPV2 and opv3), 
# only one risk period [adrug, aedrug]


   rot.mod1 <- eventdepenexp(indiv=case, astart=sta, aend=end,
                         aevent=intus, adrug=cbind(rv,rvd2), 
                         expogrp=1,aedrug=cbind(rv+21,rvd2+21), 
                         agegrp=seq(56,168,14), dataformat="multi", data=rotdat)

   rot.mod1

# Model 2: Two doses with two riks periods, 1-7 and 8-21 


   rot.mod2 <- eventdepenexp(indiv=case, astart=sta, aend=end,
                            aevent=intus, adrug=cbind(rv,rvd2),
                            aedrug=cbind(rv+21,rvd2+21), expogrp=c(1,8),
                            agegrp=seq(56,168,14), dataformat="multi", 
                            data=rotdat)   

   rot.mod2




