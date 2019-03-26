library(SIfEK)


### Name: GP.combi
### Title: Simultaneous estimation of Michaelis-Menten constant and
###   catalytic constant using combined data and the likelihood function
###   with the Gaussian process method
### Aliases: GP.combi

### ** Examples

## Not run: 
##D data('Chymo_low')
##D data('Chymo_high')
##D time1 = max(Chymo_low[,1])*1.01
##D time2 = max(Chymo_high[,1])*1.01
##D comb_GPMH=GP.combi(method=TRUE,dat1=Chymo_low[,2],time1=time1,dat2=Chymo_high[,2],time2=time2
##D                   ,enz=c(4.4e+7,4.4e+9),subs=4.4e+7,MM=4.4e+8,catal=0.05,nrepeat=10000
##D                   ,jump=1,burning=0,catal_m_v=c(1,1e+10),MM_m_v=c(1e+9,1e+18)
##D                   ,sig=c(0.005,4.4e+8)^2,va=c(var(Chymo_low[,2]),var(Chymo_high[,2])))
##D 
##D # use RAM algorithm #
##D comb_GPRAM=GP.combi(method=TRUE,RAM=TRUE,dat1=Chymo_low[,2],time1=time1,dat2=Chymo_high[,2]
##D                      ,time2=time2,enz=c(4.4e+7,4.4e+9),subs=4.4e+7,MM=4.4e+8,catal=0.05
##D                      ,nrepeat=10000,jump=1,burning=0,catal_m_v=c(1, 1e+6),MM_m_v=c(1,1e+10)
##D                      ,sig=c(1,1e+11),va=c(var(Chymo_low[,2]),var(Chymo_high[,2])))
## End(Not run)




