library(ClustVarLV)


### Name: get_comp
### Title: latent variables associated with each cluster
### Aliases: get_comp

### ** Examples

data(apples_sh)
resclvX <- CLV(X = apples_sh$senso, method = "directional", sX = TRUE)
comp4G<-get_comp(resclvX, K = 4) 




