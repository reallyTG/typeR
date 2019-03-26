library(LMest)


### Name: search.model.LM
### Title: Search for the global maximum of the log-likelihood
### Aliases: search.model.LM

### ** Examples

# example for est_lm_basic
data(data_drug)
data_drug = as.matrix(data_drug)
S = data_drug[,1:5]-1
yv = data_drug[,6]
n = sum(yv)
# Search Basic LM model

res = search.model.LM("basic",kv=1:4,S,yv,mod=1)
summary(res)





