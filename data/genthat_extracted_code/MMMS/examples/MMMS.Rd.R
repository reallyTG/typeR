library(MMMS)


### Name: MMMS
### Title: Subgroup identification using a multi-marker molecular signature
###   approach
### Aliases: MMMS extract.list get.p.boot sample.tte score2subgroup.all
###   subset.list

### ** Examples

# load the dataset
data(simdat)
    
# estimate the MMMS (No bootstrap is considered for a quick illustration)
mmms = with(simdat,MMMS(time,event,treat,bio,covar,pct.lb=20,pct.ub=80,n.boot=0,
                        pos.direction=FALSE,nfolds=5,alpha=0.5,verbose=TRUE,seed=12345))



