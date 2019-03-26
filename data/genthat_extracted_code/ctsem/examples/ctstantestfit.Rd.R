library(ctsem)


### Name: ctstantestfit
### Title: ctstantestfit
### Aliases: ctstantestfit

### ** Examples

## Not run: 
##D #' 
##D checkm<-ctModel(type='stanct',
##D   n.latent=n.latent,n.TDpred=n.TDpred,n.TIpred=n.TIpred,
##D   MANIFESTVAR=matrix(c('merror',0,0,'merror'),2,2),
##D   MANIFESTMEANS=matrix(0,nrow=n.manifest),
##D   CINT=matrix(c('cint1','cint2'),ncol=1),
##D   n.manifest=n.manifest,LAMBDA=diag(2))
##D   
##D checkm$pars$indvarying[-c(7,13)] <- FALSE
##D checkm$pars$sdscale <- .1
##D  
##D checkm$pars[c(-1,-2, -21,-22) ,c('TI1_effect','TI2_effect','TI3_effect')] <- FALSE
##D 
##D ctstantestfit<-ctStanFit(ctstantestdat,checkm,iter=500, warmup=460,thin=2,chains=2,
##D   control=list(max_treedepth=5,adapt_delta=.8),save_warmup=FALSE)
##D summary(ctstantestfit)
##D save(ctstantestfit,file='.\\data\\ctstantestfit.rda')
##D paths <- sort(Sys.glob(c("data/*.rda", "data/*.RData")))
##D library(tools)
##D resaveRdaFiles(paths)
## End(Not run)



