library(mdsOpt)


### Name: optIscalInterval
### Title: Selecting the optimal multidimensional scaling procedure for
###   interval-valued data
### Aliases: optIscalInterval
### Keywords: multidimensional scaling I-stress stress per box
###   normalization methods interval-valued data optimize

### ** Examples

#print("uncomment to run - approximately 7 seconds runtime")
#library(mdsOpt)
#library(clusterSim)
#data(data_symbolic_interval_polish_voivodships)
#x<-data_symbolic_interval_polish_voivodships
#metnor<-c("n1","n2","n3","n5","n5a","n8","n9","n9a","n11","n12a")
#methods<-c("MM","BFGS")
#res<-optIscalInterval(x,dataType="simple",normalizations=metnor,optMethods=methods,outDec=".")
#Istress<-as.numeric(gsub(",",".",res[,"I-STRESS"],fixed=TRUE))
#hhi<-as.numeric(gsub(",",".",res[,"HHI spb"],fixed=TRUE))
#t<-findOptimalIscalInterval(res)
#cs<-(min(Istress)+max(Istress))/2 # critical I-stress
#write.table(res,file="smds_HHI.csv",sep=";",dec=",",row.names=TRUE,col.names=NA)
#plot(Istress[-t$Nr],hhi[-t$Nr], xlab="I-Stress", ylab="HHI",type="n",font.lab=3)
#text(Istress[-t$Nr],hhi[-t$Nr],labels=(1:nrow(res))[-t$Nr])
#abline(v=cs,col="red")
#points(Istress[t$Nr],hhi[t$Nr], cex=5,col="red")
#text(Istress[t$Nr],hhi[t$Nr],labels=(1:nrow(res))[t$Nr],col="red")
#print(t)



