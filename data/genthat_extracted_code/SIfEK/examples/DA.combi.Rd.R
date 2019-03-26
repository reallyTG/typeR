library(SIfEK)


### Name: DA.combi
### Title: Simultaneous estimation of Michaelis-Menten constant and
###   catalytic constant using combined data and the likelihood function
###   with the diffusion approximation method.
### Aliases: DA.combi

### ** Examples

## Not run: 
##D data('Chymo_low')
##D data('Chymo_high')
##D comb_DA=DA.combi(method=TRUE,dat1=Chymo_low,dat2=Chymo_high,enz=c(4.4e+7,4.4e+9)
##D                ,subs=c(4.4e+7,4.4e+7),MM=4.4e+8,catal=0.05,sig=2.0*(c(0.005,8e+7))^2
##D                ,nrepeat=10000,jump=1,burning=0,catal_m_v = c(1, 1e+6)
##D                ,MM_m_v = c(1, 1e+10),scale_tun=100)
## End(Not run)




