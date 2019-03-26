library(tgp)


### Name: partition
### Title: Partition data according to the MAP tree
### Aliases: partition
### Keywords: tree

### ** Examples

#
# 2-d Exponential data
# (This example is based on random data.  
# It might be fun to run it a few times)
#

# get the data
exp2d.data <- exp2d.rand()
X <- exp2d.data$X; Z <- exp2d.data$Z
Xcand <- exp2d.data$XX

# fit treed GP LLM model to data w/o prediction
# basically just to get MAP tree (and plot it)
out <- btgpllm(X=X, Z=Z, pred.n=FALSE, BTE=c(2000,3000,2)) 
tgp.trees(out)

# find a treed sequential D-Optimal design 
# with 10 more points
Xcand.parts <- partition(Xcand, out)



