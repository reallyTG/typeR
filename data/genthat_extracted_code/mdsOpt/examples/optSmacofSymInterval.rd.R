library(mdsOpt)


### Name: optSmacofSymInterval
### Title: Selecting the optimal multidimensional scaling procedure for
###   interval-valued data
### Aliases: optSmacofSymInterval
### Keywords: multidimensional scaling metric MDS variable normalization
###   methods distance measures for interval-valued data interval-valued
###   data optimize

### ** Examples

# Uncomment to run
# library(mdsOpt)
# library(clusterSim)
# data(data_symbolic_interval_polish_voivodships)
# metnor<-c("n1","n2","n3","n5","n5a","n8","n9","n9a","n11","n12a")
# metscale<-c("ratio","interval","mspline")
# metdist<-c("H_q1","H_q2","U_2_q1","U_2_q2")
# res<-optSmacofSymInterval(data_symbolic_interval_polish_voivodships,dataType="simple",
# normalizations=metnor,distances=metdist,mdsmodels=metscale,spline.degrees=c(2,3),outDec=".")
# stress<-as.numeric(gsub(",",".",res[,"STRESS 1"],fixed=TRUE))
# hhi<-as.numeric(gsub(",",".",res[,"HHI spp"],fixed=TRUE))
# t<-findOptimalSmacofSym(res)
# cs<-(min(stress)+max(stress))/2 # critical stress
# plot(stress[-t$Nr],hhi[-t$Nr], xlab="Stress-1", ylab="HHI",type="n",font.lab=3)
# text(stress[-t$Nr],hhi[-t$Nr],labels=(1:nrow(res))[-t$Nr])
# abline(v=cs,col="red")
# points(stress[t$Nr],hhi[t$Nr], cex=5,col="red")
# text(stress[t$Nr],hhi[t$Nr],labels=(1:nrow(res))[t$Nr],col="red")
# print(t)



