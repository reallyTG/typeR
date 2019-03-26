library(jointPm)


### Name: jointPm-package
### Title: Risk estimation using the joint probability method ('jointPm')
### Aliases: jointPm-package jointPm
### Keywords: joint probability method, risk estimation, bivariate
###   integration.

### ** Examples

 library(jointPm)
 data(flood)
 px=flood$px;py=flood$py;z=flood$flood_table;prm=flood$prm;pout=flood$pout
 binteg(px,py,z,prm,pout,model="log",prob="ARI",nz=100,ninc=1000)



