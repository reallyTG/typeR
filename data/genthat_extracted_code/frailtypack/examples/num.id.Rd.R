library(frailtypack)


### Name: num.id
### Title: Identify individuals in Joint model for clustered data
### Aliases: num.id
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(readmission)
##D #-- here is generated cluster (5 clusters)
##D readmission <- transform(readmission,group=id%%5+1)
##D 
##D #-- exclusion all recurrent events --#
##D #--  to obtain framework of semi-competing risks --#
##D readmission2 <- subset(readmission, (t.start == 0 & event == 1) | event == 0)
##D 
##D joi.clus.gap <- frailtyPenal(Surv(time,event)~cluster(group)+
##D num.id(id)+dukes+charlson+sex+chemo+terminal(death),
##D formula.terminalEvent=~dukes+charlson+sex+chemo,
##D data=readmission2,recurrentAG=FALSE, n.knots=8,
##D kappa=c(1.e+10,1.e+10) ,Alpha="None")
##D 
## End(Not run)





