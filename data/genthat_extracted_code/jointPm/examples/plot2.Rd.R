library(jointPm)


### Name: plot2
### Title: a plot showing response variable levels versus return
###   probabilities (ARI/AEP)
### Aliases: plot2

### ** Examples

 library(jointPm)
 data(flood)
 px=flood$px;py=flood$py;z=flood$flood_table;prm=flood$prm;pout=flood$pout
 result=binteg(px,py,z,prm,pout,model="log",prob="ARI",nz=100,ninc=1000)
 plot2(result,prob="ARI")



