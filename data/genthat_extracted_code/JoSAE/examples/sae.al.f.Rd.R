library(JoSAE)


### Name: sae.al.f
### Title: Area-level small area estimation under heteroscedasticity or
###   homoscedasticity.
### Aliases: sae.al.f
### Keywords: ~survey ~models

### ** Examples

library(nlme)
#sample data
data(ulal.sub.samp.dat)
#domain means of x
data(ulal.sub.dom.dat)

#The easiest way of getting the data into the right format
#is to fit a unit-level model first.
res <-
    sae.ul.f(samp.data=ulal.sub.samp.dat,
             population.data=ulal.sub.dom.dat,
             k.ij=ulal.sub.samp.dat[,"k.ij.one"],
             formula=w.VMPRHA ~ elev.mean + elev.mean.sq,
             domain.col="stand.ID",
             sample.id.col="plot.ID",
             neg.sfrac=TRUE)

#data for AL
dat.al <- merge(res$data$samp.agg.X.pop[,c("domain.id","n.i","w.VMPRHA.ybar.i","elev.mean.X.pop")],
                res$est$se[,c("domain.id","se.srs")])

#area-level SAE under homoscedasticity
res <- sae.al.f(
    domain.id=dat.al$domain.id , n.i=dat.al$n.i , psi.i=dat.al$se.srs^2
    , formula=w.VMPRHA.ybar.i ~ elev.mean.X.pop , data=dat.al
    , b.i=rep(1, nrow(dat.al))
    , type="RE")

#area-level SAE heteroskedasticity
bi.par <- 0.39#select b.i parameter
#helper function
range01 <- function(x, ...){(x - min(x, ...)) /
                                (max(x, ...) - min(x, ...))}
res <- sae.al.f(
    domain.id=dat.al$domain.id , n.i=dat.al$n.i , psi.i=dat.al$se.srs^2
    , formula=w.VMPRHA.ybar.i ~ elev.mean.X.pop, data=dat.al
    , b.i=range01(dat.al$elev.mean.X.pop)+bi.par
    , type="RE")




