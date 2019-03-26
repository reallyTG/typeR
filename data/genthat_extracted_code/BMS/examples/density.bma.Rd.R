library(BMS)


### Name: density.bma
### Title: Coefficient Marginal Posterior Densities
### Aliases: density.bma density.zlm
### Keywords: aplot utilities

### ** Examples


 data(datafls)
 mm=bms(datafls)

 density(mm,reg="SubSahara")
 density(mm,reg=7,addons="lbz") 
 density(mm,1:9)
 density(mm,reg=2,addons="zgSE",addons.lwd=2,std.coefs=TRUE)

# plot the posterior density only for the very best model
 density(mm[1],reg=1,addons="esz")


#using the calculated density for other purposes...
 dd=density(mm,reg="SubSahara")
 plot(dd) 

 dd_list=density(mm,reg=1:3,plot=FALSE,n=400)
 plot(dd_list[[1]])


#Note that the shown density is only the part that is not zero
 dd=density(mm,reg="Abslat",addons="esl")
 pip_Abslat=sum(dd$y)*diff(dd$x)[1]

 #this pip and the EV conform to what is done by the follwing command
 coef(mm,exact=TRUE,condi.coef=TRUE)["Abslat",]




