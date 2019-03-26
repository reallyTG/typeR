library(DCL)


### Name: dcl.predict.prior
### Title: Pointwise predictions (RBNS/IBNR split) adding prior knowledge
### Aliases: dcl.predict.prior
### Keywords: htest

### ** Examples

## Data application by in Martinez-Miranda, Nielsen, Verrall and Wuthrich (2013)
data(NtrianglePrior)
data(NpaidPrior)
data(XtrianglePrior)

Ntriangle<-NtrianglePrior
Xtriangle<-XtrianglePrior
Npaid<-NpaidPrior

## Extract information about zero-claims and severity dev. inflation
my.priors<-extract.prior(Xtriangle,Npaid,Ntriangle)
my.inflat.j<-my.priors$inflat.j
my.Qi<-my.priors$Qi

# Reproducing the poinwise predicions (tables 3,4,5) in the paper
# Note: in the paper we did not use Ntriangle in the predictions 
# when modelling the predictions are slightly different

## Prior A: only using development year inflation
m<-nrow(Ntriangle)
preds.prior.A.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=rep(0,m),Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.A.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=rep(0,m),Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

## Prior B: only using zero claims inflation
preds.prior.B.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=rep(1,m),Qi=my.Qi,Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.B.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=rep(1,m),Qi=my.Qi,Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

## Prior C: only using development inflation and zero claims inflation
preds.prior.C.gen<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=my.Qi,Model=0,adj=1,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)

preds.prior.C.mod<-dcl.predict.prior(Ntriangle,Xtriangle,
          inflat.j=my.inflat.j,Qi=my.Qi,Model=2,adj=2,
          Tail=FALSE,Tables=TRUE,summ.by="diag",num.dec=2)



