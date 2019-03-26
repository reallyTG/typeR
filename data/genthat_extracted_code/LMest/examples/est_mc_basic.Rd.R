library(LMest)


### Name: est_mc_basic
### Title: Estimate basic Markov chain (MC) model
### Aliases: est_mc_basic

### ** Examples

# Example of drug consumption data
# load data
data(data_drug)
data_drug = as.matrix(data_drug)
S = data_drug[,1:5]-1
yv = data_drug[,6]
# fit of the Basic MC model
out = est_mc_basic(S,yv,mod=1,out_se=TRUE)
summary(out)



