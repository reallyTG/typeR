library(pomp)


### Name: Iterated filtering 2
### Title: IF2: Maximum likelihood by iterated, perturbed Bayes maps
### Aliases: mif2 mif2,ANY-method mif2,missing-method
###   mif2,mif2d.pomp-method mif2-mif2d.pomp mif2,pfilterd.pomp-method
###   mif2-pfilterd.pomp mif2,pomp-method mif2-pomp continue
###   continue,ANY-method continue,missing-method
###   continue,mif2d.pomp-method continue-mif2d.pomp mif2d.pomp-class
###   mif2d.pomp-methods conv.rec,mif2d.pomp-method conv.rec-mif2d.pomp
###   conv.rec,mif2List-method conv.rec-mif2List coef,mif2List-method
###   coef.rec-mif2List plot-mif2d.pomp plot,mif2d.pomp-method
###   plot-mif2List plot,mif2List-method mif2List-class c-mif2d.pomp
###   c,mif2d.pomp-method c-mif2List c,mif2List-method [-mif2List
###   [,mif2List-method rw.sd ivp
### Keywords: optimize ts

### ** Examples

## Not run: 
##D pompExample(ou2)
##D 
##D guess1 <- guess2 <- coef(ou2)
##D guess1[c('x1.0','x2.0','alpha.2','alpha.3')] <- 0.5*guess1[c('x1.0','x2.0','alpha.2','alpha.3')]
##D guess2[c('x1.0','x2.0','alpha.2','alpha.3')] <- 1.5*guess1[c('x1.0','x2.0','alpha.2','alpha.3')]
##D 
##D m1 <- mif2(ou2,Nmif=100,start=guess1,Np=1000,
##D            cooling.type="hyperbolic",cooling.fraction.50=0.05,
##D            rw.sd=rw.sd(x1.0=ivp(0.5),x2.0=ivp(0.5),
##D              alpha.2=0.1,alpha.3=0.1))
##D 
##D m2 <- mif2(ou2,Nmif=100,start=guess2,Np=1000,
##D            cooling.type="hyperbolic",cooling.fraction.50=0.05,
##D            rw.sd=rw.sd(x1.0=ivp(0.5),x2.0=ivp(0.5),
##D              alpha.2=0.1,alpha.3=0.1))
##D 
##D plot(c(m1,m2))
##D 
##D rbind(mle1=c(coef(m1),loglik=logLik(pfilter(m1,Np=1000))),
##D       mle2=c(coef(m2),loglik=logLik(pfilter(m1,Np=1000))),
##D       truth=c(coef(ou2),loglik=logLik(pfilter(m1,Np=1000))))
## End(Not run)



