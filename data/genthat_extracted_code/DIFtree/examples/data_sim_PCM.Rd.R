library(DIFtree)


### Name: data_sim_PCM
### Title: Simulated Data Set with Polytomous Items
### Aliases: data_sim_PCM

### ** Examples

data(data_sim_PCM)
 
Y <- data_sim_PCM[,1]
X <- data_sim_PCM[,-1]

apply(Y,2,table)
summary(X)
  
 



