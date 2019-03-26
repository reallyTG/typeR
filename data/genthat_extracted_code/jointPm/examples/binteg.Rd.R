library(jointPm)


### Name: binteg
### Title: bivariate integration
### Aliases: binteg

### ** Examples

 library(jointPm)
 data(flood)
 px=flood$px;py=flood$py;z=flood$flood_table;prm=flood$prm;pout=flood$pout
 binteg(px,py,z,prm,pout,model="log",prob="ARI",nz=100,ninc=1000)



