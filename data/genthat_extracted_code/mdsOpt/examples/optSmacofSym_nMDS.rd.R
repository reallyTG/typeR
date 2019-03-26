library(mdsOpt)


### Name: optSmacofSym_nMDS
### Title: Selecting the optimal multidimensional scaling procedure -
###   nonmetric MDS
### Aliases: optSmacofSym_nMDS
### Keywords: multidimensional scaling nonmetric MDS variable normalization
###   methods distance measures metric data optimize

### ** Examples

print("uncomment to run - approximately 30 seconds runtime")
# uncomment to run - approximately 30 seconds runtime#  
#  library(mdsOpt)
#  metnor<-c("n1","n2","n3","n5","n5a","n8","n9","n9a","n11","n12a")
#  metscale<-"ordinal"
#  metdist<-c("euclidean","manhattan","maximum","seuclidean","GDM1")
#  data(data_lower_silesian)
#  res<-optSmacofSym_nMDS(data_lower_silesian,normalizations=metnor,
#    distances=metdist,mdsmodels=metscale)
#  stress<-as.numeric(gsub(",",".",res[,"STRESS 1"],fixed=TRUE))
#  hhi<-as.numeric(gsub(",",".",res[,"HHI spp"],fixed=TRUE))
#  cs<-(min(stress)+max(stress))/2 # critical stress
#  t<-findOptimalSmacofSym(res,critical_stress=cs)
#  print(t)
#  plot(stress[-t$Nr],hhi[-t$Nr], xlab="Stress-1", ylab="HHI",type="n",font.lab=3)
#  text(stress[-t$Nr],hhi[-t$Nr],labels=(1:nrow(res))[-t$Nr])
#  abline(v=cs,col="red")
#  points(stress[t$Nr],hhi[t$Nr], cex=5,col="red")
#  text(stress[t$Nr],hhi[t$Nr],labels=(1:nrow(res))[t$Nr],col="red")



