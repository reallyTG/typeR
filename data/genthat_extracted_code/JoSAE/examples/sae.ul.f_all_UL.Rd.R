library(JoSAE)


### Name: sae.ul.f
### Title: Unit-level small area estimation under heteroscedasticity.
### Aliases: sae.ul.f ul.data.prep.f ul.reml.f ul.est.f
### Keywords: ~survey ~models

### ** Examples

library(nlme)
#sample data
data(ulal.sub.samp.dat)
#domain means of x
data(ulal.sub.dom.dat)

#eblup under homoskedasticity
res <-
    sae.ul.f(samp.data=ulal.sub.samp.dat,
             population.data=ulal.sub.dom.dat,
             k.ij=ulal.sub.samp.dat[,"k.ij.one"],
             formula=w.VMPRHA ~ elev.mean + elev.mean.sq,
             domain.col="stand.ID",
             sample.id.col="plot.ID",
             neg.sfrac=TRUE)

#eblup under heteroskedasticity
res <-
    sae.ul.f(samp.data=ulal.sub.samp.dat,
             population.data=ulal.sub.dom.dat,
             k.ij=ulal.sub.samp.dat[,"k.ij.em.0.48"],
             formula=w.VMPRHA ~ elev.mean + elev.mean.sq,
             domain.col="stand.ID",
             sample.id.col="plot.ID",
             neg.sfrac=TRUE)



