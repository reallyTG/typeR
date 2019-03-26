library(vioplot)


### Name: vioplot
### Title: violin plot
### Aliases: vioplot
### Keywords: hplot

### ** Examples

  # box- vs violin-plot 
  par(mfrow=c(2,1))
  mu<-2
  si<-0.6
  bimodal<-c(rnorm(1000,-mu,si),rnorm(1000,mu,si)) 
  uniform<-runif(2000,-4,4)
  normal<-rnorm(2000,0,3)
  vioplot(bimodal,uniform,normal)
  boxplot(bimodal,uniform,normal)
  
  # add to an existing plot
  x <- rnorm(100)
  y <- rnorm(100)
  plot(x, y, xlim=c(-5,5), ylim=c(-5,5))
  vioplot(x, col="tomato", horizontal=TRUE, at=-4, add=TRUE,lty=2, rectCol="gray")
  vioplot(y, col="cyan", horizontal=FALSE, at=-4, add=TRUE,lty=2)



