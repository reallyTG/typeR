library(SIfEK)


### Name: GP.multi
### Title: Simultaneous estimation of Michaelis-Menten constant and
###   catalytic constant using the likelihood function with the Gaussian
###   process method.
### Aliases: GP.multi

### ** Examples

## Not run: 
##D data('Chymo_low')
##D time1=max(Chymo_low[,1])*1.01
##D dou_GPMH=GP.multi(method=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                     ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0,catal_m_v=c(1,1e+10)
##D                     ,MM_m_v=c(1e+9,1e+18),sig=c(0.05,4.4e+8)^2,va=var(Chymo_low[,2]))
##D # use RAM algorithm #
##D dou_GPRAM=GP.multi(method=TRUE,RAM=TRUE,time=time1,dat=Chymo_low[,2],enz=4.4e+7,subs=4.4e+7
##D                       ,MM=4.4e+8,catal=0.05,nrepeat=10000,jump=1,burning=0,catal_m_v=c(1,1e+10)
##D                       ,MM_m_v=c(1e+9,1e+18),sig=c(1,1),va=var(Chymo_low[,2]))
## End(Not run)




