library(jointPm)


### Name: plot1
### Title: shows the bivariate intergration
### Aliases: plot1

### ** Examples

 library(jointPm)
 data(flood)
 px=flood$px;py=flood$py;z=flood$flood_table;prm=flood$prm;pout=flood$pout
 result=binteg(px,py,z,prm,pout,model="log",prob="ARI",nz=100,ninc=1000)
 plot1(result,prob="ARI")



