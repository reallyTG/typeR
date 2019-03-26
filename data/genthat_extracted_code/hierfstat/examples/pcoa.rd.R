library(hierfstat)


### Name: pcoa
### Title: Principal coordinate analysis
### Aliases: pcoa

### ** Examples

data(gtrunchier)
colo<-c("black","red","blue","yellow","orange","green")
pcoa(as.matrix(genet.dist(gtrunchier[,-1])),col=rep(colo,c(5,5,4,5,5,5)))



