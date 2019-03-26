library(recluster)


### Name: recluster.multi
### Title: Multiscale bootstrap based on consensus trees
### Aliases: recluster.multi
### Keywords: cluster

### ** Examples

data(datamod)
tree<-recluster.cons(datamod,tr=10)
multiboot<-recluster.multi(tree$cons,tr=10,boot=50,datamod,levels=2,step=1)
recluster.plot(tree$cons,multiboot,1,2,direction="downwards")



