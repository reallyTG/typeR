library(SEERaBomb)


### Name: summary.seerSet
### Title: Summary of seerSet object
### Aliases: summary.seerSet
### Keywords: IO

### ** Examples

## Not run: 
##D  
##D library(SEERaBomb)
##D load("~/data/SEER/mrgd/cancDef.RData") #load in canc
##D load("~/data/SEER/mrgd/popsae.RData") # load in popsae
##D canc=canc%>%select(casenum,race:yrdx,surv,cancer,trt,id) 
##D popsa=popsae%>%group_by(db,race,sex,age,year)%>%summarize(py=sum(py)) # sum on regs
##D pm=seerSet(canc,popsa,Sex="male",ageStart=0,ageEnd=100) #pooled (races) male seerSet
##D pm # no print method for seerSet object, so we see the list
##D (x=summary(pm)) # print renders summary and plot of PY
##D class(x)<-NULL #if you want to see the list as is, kill its class.
##D x    # It then goes through the regular print method for lists.
## End(Not run)



