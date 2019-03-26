library(DIFtree)


### Name: data_sim_Rasch
### Title: Simulated Data Set with Dichotomous Items
### Aliases: data_sim_Rasch

### ** Examples

data(data_sim_Rasch)
 
Y <- data_sim_Rasch[,1]
X <- data_sim_Rasch[,-1]

hist(rowSums(Y), breaks = 0:19 + 0.5)
summary(X)
  
 



