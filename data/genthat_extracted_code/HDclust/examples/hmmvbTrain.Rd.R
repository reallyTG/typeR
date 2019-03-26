library(HDclust)


### Name: hmmvbTrain
### Title: Train HMM-VB
### Aliases: hmmvbTrain

### ** Examples

# Train HMM-VB with known variable block structure
data("sim3")
Vb <- vb(2, dim=40, bdim=c(10,30), numst=c(3,5), varorder=list(c(1:10),c(11:40)))
set.seed(12345)
hmmvb <- hmmvbTrain(sim3[,1:40], VbStructure=Vb)
show(hmmvb)

## No test: 
# Train HMM-VB with unknown variable block structure using default parameters
data("sim2")
set.seed(12345)
hmmvb <- hmmvbTrain(sim2[,1:5])
show(hmmvb)

# Train HMM-VB with unknown variable block structure using with ten permutations
# and several threads
data("sim2")
set.seed(12345)
hmmvb <- hmmvbTrain(sim2[1:5], searchControl=vbSearchControl(nperm=10), nthread=3)
show(hmmvb)
## End(No test)



