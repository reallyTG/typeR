library(SEERaBomb)


### Name: print.seerSet.summary
### Title: Prints seerSet.summary objects
### Aliases: print.seerSet.summary
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D library(SEERaBomb)
##D load("~/data/SEER/mrgd/cancDef.RData") #load in canc
##D load("~/data/SEER/mrgd/popsae.RData") # load in popsae
##D canc=canc%>%select(casenum,race:histo3,surv,cancer,trt,id) 
##D popsa=popsae%>%group_by(db,race,sex,age,year)%>%summarize(py=sum(py)) # sum on regs
##D pm=seerSet(canc,popsa,Sex="male",ageStart=0,ageEnd=100) #pooled (races) male seerSet
##D pm # no print method for seerSet object, so we see the list
##D summary(pm) # print method for summary renders the summary and a plot of PY
## End(Not run)



