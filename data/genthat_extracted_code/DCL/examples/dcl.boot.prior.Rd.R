library(DCL)


### Name: dcl.boot.prior
### Title: Bootstrap distribution (the full cashflow) adding prior
###   knowledge
### Aliases: dcl.boot.prior
### Keywords: htest

### ** Examples

## Data application by in Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013)
data(NtrianglePrior)
data(NpaidPrior)
data(XtrianglePrior)

## Extract information about zero-claims and severity dev. inflation
my.priors<-extract.prior(XtrianglePrior,NpaidPrior,NtrianglePrior,Plots=FALSE)
my.inflat.j<-my.priors$inflat.j
my.Qi<-my.priors$Qi

## Bootstrap cashflow incorporating prior knowledge about
##      severity inflation and zero claims
# Only variance process
# Below only B=200 simulations for a fast example
dist.priorC.I<-dcl.boot.prior(NtrianglePrior,XtrianglePrior,
  inflat.j=my.inflat.j,Qi=my.Qi,adj=2,Tail=FALSE,boot.type=1,B=200)
Plot.cashflow(dist.priorC.I)

## Try to compare with DCL with no prior knowledge: 
# Only variance process
# dist.dcl.I<-dcl.boot.prior(NtrianglePrior,XtrianglePrior,adj=2,
#    Tail=FALSE,boot.type=1)
# Plot.cashflow(dist.dcl.I)



