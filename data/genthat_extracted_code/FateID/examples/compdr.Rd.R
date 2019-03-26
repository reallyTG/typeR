library(FateID)


### Name: compdr
### Title: Computation of dimensional reduction representations
### Aliases: compdr

### ** Examples


x <- intestine$x
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
plot(dr[["cmd"]][["D2"]],pch=20,col="grey")




