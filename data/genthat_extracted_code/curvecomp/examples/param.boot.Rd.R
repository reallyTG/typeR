library(curvecomp)


### Name: param.boot
### Title: Parameteric Bootstrap Multiple Curve Comparisons for Independent
###   Groups
### Aliases: param.boot

### ** Examples

 #Example with 12 subjects and 3 treatments groups (n1=3, n2=4, n3=5) 
 #having 300 observations per subject.
 #nboot>=1000 is strongly recommended but we use nboot=5 here
 #to cut back on run time.
 nboot<-5
 group<-c(rep(1,3),rep(2,4),rep(3,5))
 group.size<-as.vector(table(group))
 n<-length(group)
 k<-length(group.size)
 m<-360
 range<-c(31:330)
 means<-c(0,0,0)
 sds<-c(0.01,0.015,0.02)

 smoother<-function(data, spar=0.95)
 {
   return(smooth.spline(x=data, spar=spar)$y)
 }

 data<-c()

 set.seed(1)
 for(i in 1:k)
 {
   group.num<-group.size[i]
   mean<-means[i]
   sd<-sds[i]
   datamat<-matrix(rnorm((group.num*m),mean,sd),ncol=m)
   smoothdata<-t(apply(datamat,1,smoother))
   data<-rbind(data,smoothdata[,range])
 }

 #Visualizing the data having three treatment groups
 plot(data[1,]~c(1:300),type='n',main="Simulated Data",
      ylim=c(min(data),max(data)),xlab="Observation",ylab="Data")
 for(j in 1:n)
 {
   lines(data[j,]~c(1:300),col=group[j])
 }

 #Running the test
 #May take a little while to run.
 testresults<-param.boot(data=data,group=group,nboot=nboot,type="Tukey",
 fix.seed=TRUE,description=" (test_ind)")
 testresults





