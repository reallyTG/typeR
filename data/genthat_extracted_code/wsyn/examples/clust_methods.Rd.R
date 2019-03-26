library(wsyn)


### Name: clust_methods
### Title: Basic methods for the 'clust' class
### Aliases: clust_methods summary.clust print.clust set_times.clust
###   set_adj.clust set_clusters.clust set_modres.clust set_mns.clust
###   set_dat.clust set_coords.clust set_methodspecs.clust set_wmfs.clust
###   set_wpmfs.clust get_times.clust get_adj.clust get_clusters.clust
###   get_modres.clust get_mns.clust get_dat.clust get_coords.clust
###   get_methodspec.clust get_wmfs.clust get_wpmfs.clust

### ** Examples

sig<-matrix(.8,5,5)
diag(sig)<-1
lents<-50
dat1<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
dat2<-t(mvtnorm::rmvnorm(lents,mean=rep(0,5),sigma=sig))
dat<-rbind(dat1,dat2)
times<-1:lents
dat<-cleandat(dat,times,clev=1)$cdat
coords<-data.frame(Y=rep(0,10),X=1:10)
method<-"coh.sig.fast"
h<-clust(dat,times,coords,method,nsurrogs = 50)
#nsurrogs should be much higher for a real application
get_times(h)
summary(h)
print(h)




