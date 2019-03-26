library(HDclust)


### Name: getNb
### Title: Accessor for 'nb' slot
### Aliases: getNb getNb,VB-method getNb,HMMVB-method

### ** Examples

# accessing nb in instance of class VB
Vb <- vb(2, dim=10, bdim=c(4,6), numst=c(3,11), varorder=list(c(1:4),c(5:10)))
getNb(Vb)

# accessing nb in instance of class HMMVB 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvb <- hmmvbTrain(sim3[,1:40], VbStructure=Vb)
getNb(hmmvb)  
    



