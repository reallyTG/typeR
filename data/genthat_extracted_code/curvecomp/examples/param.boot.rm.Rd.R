library(curvecomp)


### Name: param.boot.rm
### Title: Parameteric Bootstrap Multiple Curve Comparisons for Repeated
###   Measures
### Aliases: param.boot.rm

### ** Examples

 ### Example with 10 subjects and 3 treatments having 100 observations per treatment.
 #nboot>=1000 is strongly recommended but we use nboot=5 here
 #to cut back on run time.
 nboot<-5
 n<-10
 treatment<-3
 m<-120
 range<-c(11:110)
 means<-c(0,0.003,0.006)
 sds<-c(0.01,0.015,0.02)

 smoother<-function(data, spar=0.95)
 {
   return(smooth.spline(x=data, spar=spar)$y)
 }

 data<-c()

 set.seed(1)
 for(i in 1:treatment)
 {
   mean<-means[i]
   sd<-sds[i]
   datamat<-matrix(rnorm((n*m),mean,sd),ncol=m)
   smoothdata<-t(apply(datamat,1,smoother))
   data<-cbind(data,smoothdata[,range])
 }

 #Visualizing the data having three treatments
 plot(data[1,]~c(1:300),type='n',main="Simulated Data",
      ylim=c(min(data),max(data)),xlab="Observation",ylab="Data")
 for(j in 1:n)
 {
   lines(data[j,c(1:100)]~c(1:100),col=j)
   lines(data[j,c(101:200)]~c(101:200),col=j)
   lines(data[j,c(201:300)]~c(201:300),col=j)
 }
 abline(v=100,lty=2)
 abline(v=200,lty=2)

 #Running the test
 #May take a little while to run.

 testresults<-param.boot.rm(data=data,treatment=treatment,nboot=nboot,
 type="Tukey",fix.seed=TRUE,description=" (test_rm)")
 testresults





