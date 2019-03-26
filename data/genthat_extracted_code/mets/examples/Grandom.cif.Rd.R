library(mets)


### Name: Grandom.cif
### Title: Additive Random effects model for competing risks data for
###   polygenetic modelling
### Aliases: Grandom.cif
### Keywords: survival

### ** Examples

## No test: 
 ## Reduce Ex.Timings
 library("timereg")
 library("survival")
 d <- simnordic.random(5000,delayed=TRUE,
       cordz=1.0,cormz=2,lam0=0.3,country=TRUE)
 times <- seq(50,90,by=10)
 addm<-comp.risk(Event(time,cause)~const(country)+cluster(id),data=d,
 times=times,cause=1,max.clust=NULL)

 ### making group indidcator 
 mm <- model.matrix(~-1+factor(zyg),d)

 out1m<-random.cif(addm,data=d,cause1=1,cause2=1,theta=1,
		   theta.des=mm,same.cens=TRUE)
 summary(out1m)
 
 ## this model can also be formulated as a random effects model 
 ## but with different parameters
 out2m<-Grandom.cif(addm,data=d,cause1=1,cause2=1,
		    theta=c(0.5,1),step=1.0,
		    random.design=mm,same.cens=TRUE)
 summary(out2m)
 1/out2m$theta
 out1m$theta
 
 ####################################################################
 ################### ACE modelling of twin data #####################
 ####################################################################
 ### assume that zygbin gives the zygosity of mono and dizygotic twins
 ### 0 for mono and 1 for dizygotic twins. We now formulate and AC model
 zygbin <- d$zyg=="DZ"

 n <- nrow(d)
 ### random effects for each cluster
 des.rv <- cbind(mm,(zygbin==1)*rep(c(1,0)),(zygbin==1)*rep(c(0,1)),1)
 ### design making parameters half the variance for dizygotic components
 pardes <- rbind(c(1,0), c(0.5,0),c(0.5,0), c(0.5,0), c(0,1))

 outacem <-Grandom.cif(addm,data=d,cause1=1,cause2=1,
		same.cens=TRUE,theta=c(0.35,0.15),
            step=1.0,theta.des=pardes,random.design=des.rv)
 summary(outacem)

## End(No test)



