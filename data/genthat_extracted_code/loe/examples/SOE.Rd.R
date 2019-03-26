library(loe)


### Name: SOE
### Title: Soft Ordinal Embedding (SOE)
### Aliases: SOE

### ** Examples

library(MASS)
data(eurodist)
OIF <- get.order(as.matrix(eurodist))
sid <- sample(1:nrow(OIF))
POI <- OIF[sid[1:1000],]
result <- SOE(CM=POI, N=nrow(as.matrix(eurodist)),p=2, c=0.1,maxit =1000,report=100)
plot(result$X,type="n",xlab="Dim. 1", ylab="Dim. 2")
text(result$X,rownames(as.matrix(eurodist)),cex=1)



