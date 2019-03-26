library(SCCS)


### Name: eventdepenobs
### Title: SCCS with event-dependent observation periods
### Aliases: eventdepenobs
### Keywords: Parametric

### ** Examples

 library(SCCS)
 
 # Nicotine replacement therapy and myocardial infarction (MI)
 # With no age effect included
 

 ## No test: 
nrt.mod <- eventdepenobs(event~nrt, indiv=case, astart=nrt,
             aend=act, aevent=mi, adrug=nrt, aedrug=nrt+28,
             censor=cen, expogrp=c(0,8,15,22), agegrp=NULL,
             data=nrtdat)
## End(No test)
 
 
 # Respiratory tract infections and MI
 # Age effect included
 # intial values provided and there are two risk periods
 
 ## No test: 
uni <- (1-duplicated(midat$case))
## End(No test)
 ## No test: 
ageq <- floor(quantile(midat$mi[uni==1], seq(0.1,0.9,0.1), names=FALSE))
## End(No test)
                   # age groups
 
 ## No test: 
mi.mod <- eventdepenobs(event~rti+age, indiv=case, astart=sta,
                         aend=end, aevent=mi, adrug=rti, aedrug=rti+14,
                         expogrp=c(0,8), agegrp=ageq, censor=cen, data=midat,
                         initval=rep(1.1,4))
## End(No test)
                         
 ## No test: 
mi.mod
## End(No test)
 
                         
 


