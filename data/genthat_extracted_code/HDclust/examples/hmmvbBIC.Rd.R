library(HDclust)


### Name: hmmvbBIC
### Title: BIC for HMM-VB
### Aliases: hmmvbBIC

### ** Examples

## No test: 
# Default search for the optimal number of states for HMM-VB model 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(1,1), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvbBIC(sim3[1:40], VbStructure)

# Search for the optimal number of states for HMM-VB model using 
# provided values for the number of states 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(1,1), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvbBIC(sim3[1:40], VbStructure=Vb, numst=c(2L, 4L, 6L))

# Search for the optimal number of states for HMM-VB model using 
# provided configurations of the number of states 
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(1,1), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
configs = list(c(1,2), c(3,5), c(6,7))
hmmvbBIC(sim3[1:40], VbStructure=Vb, configList=configs)
## End(No test)



