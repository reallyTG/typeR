library(plotrix)


### Name: box.heresy
### Title: Display a sort of box plot
### Aliases: box.heresy
### Keywords: misc

### ** Examples

 y1<-runif(20,2,10)
 y2<-rnorm(30,6,2)
 y3<-sample(0:20,40,TRUE)
 Ns<-c(20,30,40)
 ymean<-c(mean(y1),mean(y2),mean(y3))
 y1inner<-quantile(y1,probs=c(.16,.84))
 y2inner<-c(ymean[2]+sd(y2),ymean[2]-sd(y2))
 y3inner<-quantile(y3,probs=c(.16,.84))
 uinner<-c(y1inner[1],y2inner[1],y3inner[1])
 linner<-c(y1inner[2],y2inner[2],y3inner[2])
 ulim<-c(max(y1),max(y2),max(y3))
 llim<-c(min(y1),min(y2),min(y3))
 box.heresy(ymean,uinner=uinner,linner=linner,ulim=ulim,llim=llim,boxwidth=Ns,
  main="Boxplot of means, central spread and range",xlab="Distribution",
  xaxlab=c("Uniform","Normal","Sample"))
 y1outer<-
 y<-runif(5)
 ulim<-runif(5)
 llim<-runif(5)
 uinner<-ulim/2
 linner<-llim/2
 box.heresy(y,uinner=uinner,linner=linner,ulim=ulim,llim=llim,
  intervals=TRUE,main="The heretical boxplot",
  xlab="Number of observations",ylab="Value")



