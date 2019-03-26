library(dynia)


### Name: fitdi
### Title: Fit Dynamic Intervention Model
### Aliases: fitdi
### Keywords: ts

### ** Examples

####Casualties Intervention####
fitdi(z=casualties[,1],T=70,xint=scale(casualties[,2]),itype="s",order=c(1,0,0),
 seasonal=list(order=c(0,0,1),period=12),delta0=0)

####Nile River Intervention####
fitdi(z=Nile,T=34,itype="p",order=c(0,0,1),delta=1)




