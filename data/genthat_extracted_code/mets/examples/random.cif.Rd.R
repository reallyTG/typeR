library(mets)


### Name: random.cif
### Title: Random effects model for competing risks data
### Aliases: random.cif
### Keywords: survival

### ** Examples

## No test: 
 ## Reduce Ex.Timings
 library("timereg")
 d <- simnordic.random(4000,delayed=TRUE,
       cordz=0.5,cormz=2,lam0=0.3,country=TRUE)
 times <- seq(50,90,by=10)
 add1<-comp.risk(Event(time,cause)~const(country)+cluster(id),data=d,
 times=times,cause=1,max.clust=NULL)

 ### making group indidcator 
 mm <- model.matrix(~-1+factor(zyg),d)

 out1<-random.cif(add1,data=d,cause1=1,cause2=1,theta=1,same.cens=TRUE)
 summary(out1)

 out2<-random.cif(add1,data=d,cause1=1,cause2=1,theta=1,
		   theta.des=mm,same.cens=TRUE)
 summary(out2)

#########################################
##### 2 different causes
#########################################

 add2<-comp.risk(Event(time,cause)~const(country)+cluster(id),data=d,
                  times=times,cause=2,max.clust=NULL)
 out3<-random.cif(add1,data=d,cause1=1,cause2=2,cif2=add2,sym=1,same.cens=TRUE)
 summary(out3) ## negative dependence

 out4<-random.cif(add1,data=d,cause1=1,cause2=2,cif2=add2,theta.des=mm,sym=1,same.cens=TRUE)
 summary(out4) ## negative dependence
## End(No test)



