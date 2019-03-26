library(fda.usc)


### Name: metric.kl
### Title: Kullback-Leibler distance
### Aliases: metric.kl
### Keywords: cluster

### ** Examples


## Not run: 
##D    
##D int.simpson2<-fda.usc:::int.simpson2
##D n<-201                                                                                       
##D tt01<-seq(0,1,len=n)                                                                         
##D rtt01<-c(0,1)  
##D 
##D x1<-dbeta(tt01,20,5)                                                                           
##D x2<-dbeta(tt01,21,5)                                                                           
##D y1<-dbeta(tt01,5,20)                                                                           
##D y2<-dbeta(tt01,5,21)                                                                           
##D xy<-fdata(rbind(x1,x2,y1,y2),tt01,rtt01)
##D plot(xy)
##D round(metric.kl(xy,xy,eps=1e-5),6)  
##D round(metric.kl(xy,eps=1e-5),6)
##D round(metric.kl(xy,eps=1e-6),6)
##D round(metric.kl(xy,xy,symm=FALSE,eps=1e-5),6)  
##D round(metric.kl(xy,symm=FALSE,eps=1e-5),6)
##D 
##D plot(c(fdata(y1[1:101]),fdata(y2[1:101])))                       
##D metric.kl(fdata(x1))  
##D metric.kl(fdata(x1),fdata(x2),eps=1e-5,symm=F)       
##D metric.kl(fdata(x1),fdata(x2),eps=1e-6,symm=F)       
##D metric.kl(fdata(y1[1:101]),fdata(y2[1:101]),eps=1e-13,symm=F)  
##D metric.kl(fdata(y1[1:101]),fdata(y2[1:101]),eps=1e-14,symm=F)  
##D 
## End(Not run)   



