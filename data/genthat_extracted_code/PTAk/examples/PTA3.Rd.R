library(PTAk)


### Name: PTA3
### Title: Principal Tensor Analysis on 3 modes
### Aliases: PTA3
### Keywords: array algebra multivariate

### ** Examples

 # example using Zone_climTUN dataset
 #  
# library(maptools)
# library(RColorBrewer)
# Yl=brewer.pal(11,"PuOr")
# data(Zone_climTUN)
## in fact a modified version of plot.Map was used
# plot(Zone_climTUN,ol=NA,auxvar=Zone_climTUN$att.data$PREC_OCTO)
##indicators 84 +3 to repeat
# Zone_clim<-Zone_climTUN$att.data[,c(2:13,15:26,28:39,42:53,57:80,83:95,55:56)]
# Zot <-Zone_clim[,85:87] ;temp <-colnames(Zot) 
# Zot <- as.matrix(Zot)%x%t(as.matrix(rep(1,12)))
# colnames(Zot) <-c(paste(rep(temp [1],12),1:12),paste(rep(temp [2],12),1:12),
#	 paste(rep(temp [3],12),1:12))
# Zone_clim <-cbind(Zone_clim[,1:84],Zot)
 
# Zone3w <- array(as.vector(as.matrix(Zone_clim)),c(2599,12,10))
## preprocessing
#Zone3w<-Multcent(dat=Zone3w,bi=NULL,by=3,centre=mean, 
#	centrebyBA=c(TRUE,FALSE),scalebyBA=c(TRUE,FALSE))
# Zone3w.PTA3<-PTA3(Zone3w,nbPT=3,nbPT2=3)
## summary and plot
# summary(Zone3w.PTA3)
#plot(Zone3w.PTA3,mod=c(2,3),nb1=1,nb2=11,lengthlabels=5,coefi=list(c(1,1,1),c(1,-1,-1)))
#plot(Zone_climTUN,ol=NA,auxvar=Zone3w.PTA3[[1]]$v[1,],nclass=30)
#plot(Zone_climTUN,ol=NA,auxvar=Zone3w.PTA3[[1]]$v[11,],nclass=30)
 
 ##############
 cat(" A little fun using iris3 and matching randomly 15 for each iris sample!","\n")
 cat("   then performing a PTA-3modes.  If many draws are done, plots")
 cat("   show the stability of the first and third Principal Tensors.","\n")
 cat("iris3 is centered and reduced beforehand for each original variables.","\n")
#  demo function 
# source(paste(R.home(),"/library/PTAk/demo/PTA3.R",sep=""))
# demo.PTA3(bootn=10,show=5,openX11s=FALSE)
 



