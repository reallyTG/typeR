library(MBSGS)


### Name: BGLSS
### Title: Bayesian Group Lasso with Spike and Slab prior
### Aliases: BGLSS
### Keywords: regression

### ** Examples


## Simulation of datasets X and Y with group variables
set.seed(1)
data1 = gen_data_uni(nsample = 120,cor.var=0.5, ntrain = 80)
data1 = normalize(data1)


true_model <- data1$true_model
X <- data1$X
Y<- data1$Y
train_idx <- data1$train_idx
gsize <- data1$gsize
## We recommend to set niter=50000, burnin=10000
## num_update = 100 and niter.update = 100 
## to reach convergence

model <- BGLSS(Y[,1],X,niter=500,burnin=100,group_size=gsize,
num_update = 20,niter.update = 20)
model$pos_median!=0
true_model




