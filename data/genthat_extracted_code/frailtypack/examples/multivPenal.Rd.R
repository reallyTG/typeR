library(frailtypack)


### Name: multivPenal
### Title: Fit a multivariate frailty model for two types of recurrent
###   events and a terminal event.
### Aliases: multivPenal transfo.table for multivariate frailty model
### Keywords: methods models multiv

### ** Examples



## Not run: 
##D 
##D ###--- Multivariate Frailty model ---###
##D 
##D data(dataMultiv)
##D 
##D # (computation takes around 60 minutes)
##D modMultiv.spli <- multivPenal(Surv(TIMEGAP,INDICREC)~cluster(PATIENT)+v1+v2+
##D              event2(INDICMETA)+terminal(INDICDEATH),formula.Event2=~v1+v2+v3,
##D              formula.terminalEvent=~v1,data=dataMultiv,n.knots=c(8,8,8),
##D              kappa=c(1,1,1),initialize=FALSE)
##D 
##D print(modMultiv.spli)
##D 
##D modMultiv.weib <- multivPenal(Surv(TIMEGAP,INDICREC)~cluster(PATIENT)+v1+v2+
##D              event2(INDICMETA)+terminal(INDICDEATH),formula.Event2=~v1+v2+v3,
##D              formula.terminalEvent=~v1,data=dataMultiv,hazard="Weibull")
##D 
##D print(modMultiv.weib)
##D 
##D modMultiv.cpm <- multivPenal(Surv(TIMEGAP,INDICREC)~cluster(PATIENT)+v1+v2+
##D              event2(INDICMETA)+terminal(INDICDEATH),formula.Event2=~v1+v2+v3,
##D              formula.terminalEvent=~v1,data=dataMultiv,hazard="Piecewise-per",
##D              nb.int=c(6,6,6))
##D 
##D print(modMultiv.cpm)
##D 
## End(Not run)





