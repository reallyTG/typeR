library(gamair)


### Name: bird
### Title: Bird distribution data from Portugal
### Aliases: bird
### Keywords: data

### ** Examples

  data(bird)
  species <- "crestlark"
  op<-par(bg="white",mfrow=c(1,1),mar=c(5,5,1,1))
  ind <- bird[[species]]==0&!is.na(bird[[species]])
  plot(bird$y[ind]/1000,1000-bird$x[ind]/1000,pch=19,cex=.3,col="white",
     ylab="km west",xlab="km north",cex.lab=1.4,cex.axis=1.3,type="n")
  polygon(c(4000,4700,4700,4000),c(250,250,600,600),col="grey",border="black")
  points(bird$y[ind]/1000,1000-bird$x[ind]/1000,pch=19,cex=.3,col="white")
  ind <- bird[[species]]==1&!is.na(bird[[species]])
  with(bird,points(y[ind]/1000,1000-x[ind]/1000,pch=19,cex=.3))
  par(op)



