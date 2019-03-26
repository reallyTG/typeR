library(fclust)


### Name: butterfly
### Title: Butterfly data
### Aliases: butterfly
### Keywords: data multivariate

### ** Examples

## butterfly data
data(butterfly)
plot(butterfly,type='n')
text(butterfly[,1],butterfly[,2],labels=rownames(butterfly),cex=0.7,lwd=2)
## membership degree matrix using fuzzy k-means (rounded)
round(FKM(butterfly)$U,2)
## membership degree matrix using fuzzy k-means with noise cluster (rounded)
round(FKM.noise(butterfly,delta=3)$U,2)



