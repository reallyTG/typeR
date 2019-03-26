library(plotrix)


### Name: dispersion
### Title: Display a measure of dispersion.
### Aliases: dispersion dispbars
### Keywords: misc

### ** Examples

 disptest<-matrix(rnorm(200),nrow=20)
 disptest.means<-rowMeans(disptest)
 row.order<-order(disptest.means)
 se.disptest<-unlist(apply(disptest,1,std.error))
 plot(disptest.means[row.order],main="Dispersion as error bars",
  ylim=c(min(disptest.means-se.disptest),max(disptest.means+se.disptest)),
  xlab="Occasion",ylab="Value")
 dispersion(1:20,disptest.means[row.order],se.disptest[row.order])
 plot(disptest.means[row.order],main="Dispersion as confidence band",
  ylim=c(min(disptest.means-se.disptest),max(disptest.means+se.disptest)),
  xlab="Occasion",ylab="Value")
 dispersion(1:20,disptest.means[row.order],se.disptest[row.order],type="l",
  fill="#eeccee",lty=2,pch=1)
 disptest2<-matrix(sample(c(TRUE,FALSE),200,TRUE),nrow=10)
 disptest.prop<-rowMeans(disptest2)
 disptest.ulim<-disptest.llim<-rep(NA,10)
 for(i in 1:10) {
  disptest.ulim[i]<-binciWu(disptest2[i,],20)
  disptest.llim[i]<-binciWl(disptest2[i,],20)
 }
 plot(disptest.prop,main="Dispersion as binomial confidence intervals",
  ylim=c(min(disptest.llim),max(disptest.ulim)),
  xlab="Sample",ylab="Proportion")
 dispersion(1:10,disptest.prop,disptest.ulim,disptest.llim,
  interval=FALSE,lty=2,pch=1)



