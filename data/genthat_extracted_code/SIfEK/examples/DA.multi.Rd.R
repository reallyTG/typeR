library(SIfEK)


### Name: DA.multi
### Title: Simultaneous estimation of Michaelis-Menten constant and
###   catalytic constant using the likelihood function with diffusion
###   approximation method
### Aliases: DA.multi

### ** Examples

## Not run: 
##D data('Chymo_low')
##D dou_DA=DA.multi(method=TRUE,dat=Chymo_low,enz=4.4e+7,subs=4.4e+7,MM=4.4e+8,catal=0.05
##D                 ,nrepeat=10000,jump=1,burning=1,catal_m_v=c(1,1e+10),MM_m_v=c(1e+9,1e+18)
##D                 ,sig=2.4*0.001*c(0.05,4.4e+8),scale_tun=80)
## End(Not run)




