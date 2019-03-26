library(ClustVarLV)


### Name: CLV
### Title: Hierarchical clustering of variables with consolidation
### Aliases: CLV

### ** Examples

data(apples_sh)
#directional groups
resclvX <- CLV(X = apples_sh$senso, method = "directional", sX = TRUE)
plot(resclvX,type="dendrogram")
plot(resclvX,type="delta")
#local groups with external variables Xr
resclvYX <- CLV(X = apples_sh$pref, Xr = apples_sh$senso, method = "local", sX = FALSE, sXr = TRUE)




