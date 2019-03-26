library(HDclust)


### Name: getNumst
### Title: Accessor for 'numst' slot
### Aliases: getNumst getNumst,VB-method getNumst,HMM-method
###   getNumst,HMMVB-method getNumst,HMMVBBIC-method

### ** Examples

# accessing numst in instance of class VB
Vb <- vb(2, dim=10, bdim=c(4,6), numst=c(3,11), varorder=list(c(1:4),c(5:10)))
getNumst(Vb)

# accessing getNumst in instance of class HMM 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvb <- hmmvbTrain(sim3[,1:40], VbStructure=Vb)
getNumst(getHmmChain(hmmvb)[[1]])  
    
# accessing numst in instance of class HMMVB 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvb <- hmmvbTrain(sim3[,1:40], VbStructure=Vb)
getNumst(hmmvb)  
    
## No test: 
# accessing numst used in model selection in instance of class HMMVBBIC 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
modelBIC <- hmmvbBIC(sim3[,1:40], VbStructure=Vb)
getNumst(modelBIC)
## End(No test)
    



