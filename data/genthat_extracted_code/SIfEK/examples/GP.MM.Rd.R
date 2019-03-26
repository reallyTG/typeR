library(SIfEK)


### Name: GP.MM
### Title: Estimation of single Michaelis-Menten constant using the
###   Gaussian process method The function estimates single
###   Michaelis-Menten constant using the likelihood function with the
###   Gaussian process method.
### Aliases: GP.MM

### ** Examples

## Not run: 
##D data('Chymo_low')
##D time1=max(Chymo_low[,1])*1.01
##D sm_GPMH=GP.MM(method=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                       ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0
##D                       ,MM_m_v=c(1,1e+10),sig=8e+7,va=var(Chymo_low[,2]))
##D # use RAM algorithm #
##D sm_GPRAM=GP.MM(method=TRUE,RAM=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                         ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0
##D                         ,MM_m_v=c(1,1e+10),sig=500,va=var(Chymo_low[,2]))
## End(Not run)




