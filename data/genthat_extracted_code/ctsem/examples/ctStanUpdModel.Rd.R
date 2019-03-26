library(ctsem)


### Name: ctStanUpdModel
### Title: Update an already compiled and fit ctStanFit object
### Aliases: ctStanUpdModel

### ** Examples

## Not run: 
##D  newm<-ctModel(type='stanct',
##D   n.latent=ctstantestfit$ctstanmodel$n.latent,
##D   n.TDpred=ctstantestfit$ctstanmodel$n.TDpred,
##D   n.TIpred=ctstantestfit$ctstanmodel$n.TIpred,
##D   MANIFESTVAR=matrix(c('merror',0,0,'merror'),2,2),
##D   MANIFESTMEANS=matrix(0,nrow=ctstantestfit$ctstanmodel$n.manifest),
##D   CINT=matrix(c(0,'cint2'),ncol=1),
##D   n.manifest=ctstantestfit$ctstanmodel$n.manifest,
##D   LAMBDA=diag(2))
##D   
##D  newdat <- ctstantestdat
##D  newdat <- newdat[newdat[,'id']!=1,]
##D  newfit <- ctStanUpdModel(ctstantestfit, newdat, newm)
##D  
## End(Not run)



