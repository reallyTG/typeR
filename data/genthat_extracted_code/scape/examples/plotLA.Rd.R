library(scape)


### Name: plotLA
### Title: Plot Length at Age
### Aliases: plotLA

### ** Examples

plotLA(x.oreo, xlab="Age", ylab="Length (cm)")

mykey <- list(text=list(lab=c("Female","Male")), space="right",
              lines=list(lwd=4,col=c("red","blue")))
plotLA(x.oreo, together=TRUE, xlab="Age", ylab="Length (cm)", pch=NA,
       key=mykey)

mykey <- list(text=list(lab=c("Female","Male")), space="right",
              points=list(pch=16,cex=0.5,col=c("red","blue")))
plotLA(x.oreo, together=TRUE, xlab="Age", ylab="Length (cm)",
       col.points=c("red","blue"), lty.lines=0, key=mykey)



