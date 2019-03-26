library(SIfEK)


### Name: GP.cat
### Title: Estimation of single catalytic constant using Gaussian processes
### Aliases: GP.cat

### ** Examples

## Not run: 
##D data('Chymo_low')
##D time1=max(Chymo_low[,1])*1.01
##D sk_GPMH=GP.cat(method=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                       ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0
##D                       ,catal_m_v=c(1,10000),sig=0.016,va=var(Chymo_low[,2]))
##D # use RAM algorithm #
##D sk_GPRAM=GP.cat(method=TRUE,RAM=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                       ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0
##D                       ,catal_m_v=c(1,10000),sig=0.1,va=var(Chymo_low[,2]))
## End(Not run)




