library(BSagri)


### Name: IAcontrasts
### Title: Interaction contrasts for 2-factorial designs
### Aliases: IAcontrasts
### Keywords: htest

### ** Examples


IAC<-IAcontrasts(type=c("Tukey", "Tukey"), k=c(3,4))

IAC

IAC2<-c2compnames(IAC, ntype="sequ")
IAC2




