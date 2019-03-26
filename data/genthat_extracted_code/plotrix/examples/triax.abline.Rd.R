library(plotrix)


### Name: triax.abline
### Title: Lines for triangle plot
### Aliases: triax.abline
### Keywords: misc

### ** Examples

 triax.return<-triax.plot(data.frame(bottom=0.4,right=0.3,left=0.3),
  main="Triax ablines",no.add=FALSE)
 triax.abline(l=0.3,col="red")
 triax.abline(r=0.3,col="green")
 triax.abline(b=0.4,col="blue")
 par(triax.return$oldpar)



