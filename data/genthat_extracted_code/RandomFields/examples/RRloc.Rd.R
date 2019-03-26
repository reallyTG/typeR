library(RandomFields)


### Name: RRloc
### Title: Location and Scale Modification of A Distribution
### Aliases: RRloc
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## empirical density of the distribution 'RRspheric'
model <- RRspheric(balldim=2)
hist(RFrdistr(model, n=1000), 50)

## empirical density of the distribution 'RRspheric', shifted by 3
model <- RRloc(mu=3, RRspheric(balldim=2))
hist(RFrdistr(model, n=1000), 50)
## Don't show: 
FinalizeExample()
## End(Don't show)


