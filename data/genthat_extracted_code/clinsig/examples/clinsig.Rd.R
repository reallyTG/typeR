library(clinsig)


### Name: clinsig
### Title: Calculate clinical significance criteria.
### Aliases: clinsig

### ** Examples

 pre.x<-runif(30,3,6)
 post.x<-runif(30,1,4)
 clinsig(pre.x,post.x,func.mct=1,func.disp=1,xlim=c(1,6),ylim=c(1,6))
 # simulate scores on a typical psychological assessment with a limited
 # range and a large separation between the pre- and post- assessments
 pre.x<-c(3,3,4,5,5,6,6,6,6,7,7,7,8,8,8,8,9,9,10,10)
 post.x<-c(13,12,15,14,12,18,13,17,NA,20,16,22,23,15,19,17,18,21,13,15)
 big.sep<-clinsig(pre.x,post.x,mct="median",disp="mad",func.mct=19,func.disp=2,
  do.plot=FALSE)
 hist(big.sep,main="Widely separated samples")
 legend(20,3.8,c("Pre","Post"),fill=c("red","green"))
 # now squeeze the two samples together to show how the criteria change positions
 post.x<-post.x-7
 little.sep<-clinsig(pre.x,post.x,mct="median",disp="mad",func.mct=15,func.disp=2,
  do.plot=FALSE)
 hist(little.sep,main="Closely spaced samples")
 legend(12.5,3.8,c("Pre","Post"),fill=c("red","green"))
 # example from Evans, Margison & Barkham, 1998 with simulated data
 set.seed(12345)
 # values from EMB 
 pre_mct<-1.81
 pre_disp<-0.53
 post_mct<-0.79
 post_disp<-0.5
 func_mct<-0.72
 func_disp<-0.57
 # accept EMB's normality of distribution
 pre_treat<-rnorm(40,pre_mct,pre_disp)
 post_treat<-rnorm(40,post_mct,post_disp)
 # make sure that no scores go below zero
 post_treat[post_treat<0]<-0
 emb<-clinsig(pre_treat,post_treat,
  dys.mct=pre_mct,func.mct=func_mct,
  dys.disp=pre_disp,func.disp=func_disp,
  coef.alpha=0.89,
  main="Clinical significance plot with reliable change window")
 print(emb)
 hist(emb)



