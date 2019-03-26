library(funFEM)


### Name: funFEM
### Title: The funFEM algorithm for the clustering of functional data.
### Aliases: funFEM
### Keywords: clustering functional data

### ** Examples

# Clustering the well-known "Canadian temperature" data (Ramsay & Silverman)
basis <- create.bspline.basis(c(0, 365), nbasis=21, norder=4)
fdobj <- smooth.basis(day.5, CanadianWeather$dailyAv[,,"Temperature.C"],basis,
        fdnames=list("Day", "Station", "Deg C"))$fd
res = funFEM(fdobj,K=4)

# Visualization of the partition and the group means
par(mfrow=c(1,2))
plot(fdobj,col=res$cls,lwd=2,lty=1)
fdmeans = fdobj; fdmeans$coefs = t(res$prms$my)
plot(fdmeans,col=1:max(res$cls),lwd=2)

## DO NOT RUN
# # Load the velib data and smoothing
# data(velib)
# basis<- create.fourier.basis(c(0, 181), nbasis=25)
# fdobj <- smooth.basis(1:181,t(velib$data),basis)$fd
# 
# # Clustrering with FunFEM
# res = funFEM(fdobj,K=6,model='AkjBk',init='kmeans',lambda=0,disp=TRUE)
# 
# # Visualization of group means
# fdmeans = fdobj; fdmeans$coefs = t(res$prms$my)
# plot(fdmeans,col=1:res$K,xaxt='n',lwd=2)
# axis(1,at=seq(5,181,6),labels=velib$dates[seq(5,181,6)],las=2)
# 
# # Choice of K
# res = funFEM(fdobj,K=2:20,model='AkjBk',init='kmeans',lambda=0,disp=TRUE)
# plot(2:20,res$plot$bic,type='b',xlab='K',main='BIC')
# 
# # Computation of the closest stations from the group means
# par(mfrow=c(3,2))
# for (i in 1:res$K) {
#   matplot(t(velib$data[which.max(res$P[,i]),]),type='l',lty=i,col=i,xaxt='n',
#      lwd=2,ylim=c(0,1))
#   axis(1,at=seq(5,181,6),labels=velib$dates[seq(5,181,6)],las=2)
#   title(main=paste('Cluster',i,' - ',velib$names[which.max(res$P[,i])]))
# }
# 
# # Visualization in the discriminative subspace (projected scores)
# par(mfrow=c(1,1))
# plot(t(fdobj$coefs)
# text(t(fdobj$coefs)
# 
# # Spatial visualization of the clustering (with library ggmap)
# library(ggmap)
# Mymap = get_map(location = 'Paris', zoom = 12, maptype = 'terrain')
# ggmap(Mymap) + geom_point(data=velib$position,aes(longitude,latitude),
#     colour = I(res$cl), size = I(3))
# 
# # FunFEM clustering with sparsity
# res2 = funFEM(fdobj,K=res$K,model='AkjBk',init='user',Tinit=res$P,
#     lambda=0.01,disp=TRUE)
# 
# # Visualization of group means and the selected functional bases
# split.screen(c(2,1))
# fdmeans = fdobj; fdmeans$coefs = t(res2$prms$my)
# screen(1); plot(fdmeans,col=1:res2$K,xaxt='n',lwd=2); axis(1,at=seq(5,181,6),
#       labels=velib$dates[seq(5,181,6)],las=2)
# basis$dropind = which(rowSums(abs(res2$U))==0)
# screen(2); plot(basis,col=1,lty=1,xaxt='n',xlab='Disc. basis functions')
# axis(1,at=seq(5,181,6),labels=velib$dates[seq(5,181,6)],las=2)
# close.screen(all=TRUE)



