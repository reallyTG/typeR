library(recluster)


### Name: recluster.plot
### Title: A plotter for recluster bootstrapped objects
### Aliases: recluster.plot
### Keywords: hplot

### ** Examples

data(datamod)
tree<-recluster.cons(datamod, tr=10)
boot<-recluster.boot(tree$cons,datamod, tr=10, boot=50)
recluster.plot(tree$cons,boot,direction="downwards")



