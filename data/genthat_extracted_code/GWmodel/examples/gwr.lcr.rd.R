library(GWmodel)


### Name: gwr.lcr
### Title: GWR with a locally-compensated ridge term
### Aliases: gwr.lcr ridge.lm print.gwrlcr
### Keywords: ridge, GWR

### ** Examples

data(DubVoter)
require(RColorBrewer)

# Function to find the global condition number (CN)
BKW_cn <- function (X) {
  p <- dim(X)[2]
  Xscale <- sweep(X, 2, sqrt(colSums(X^2)), "/")
  Xsvd <- svd(Xscale)$d
  cn <- Xsvd[1] / Xsvd[p]
  cn
}
#
X <- cbind(1,Dub.voter@data[,3:10])
head(X)
CN.global <- BKW_cn(X)
CN.global
## Not run: 
##D # gwr.lcr function with a global bandwidth to check that the global CN is found
##D gwr.lcr1 <- gwr.lcr(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64, data=Dub.voter, bw=10000000000)
##D summary(gwr.lcr1$SDF$Local_CN)
##D 
##D # Find and map the local CNs from a basic GWR fit using the lcr-gwr function 
##D #(note this is NOT the locally-compensated ridge GWR fit as would need to set 
##D #lambda.adjust=TRUE and cn.thresh=30, say)
##D 
##D bw.lcr2 <- bw.gwr.lcr(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64, data=Dub.voter, kernel="bisquare", adaptive=TRUE)
##D gwr.lcr2 <- gwr.lcr(GenEl2004~DiffAdd+LARent+SC1+Unempl+LowEduc+Age18_24
##D +Age25_44+Age45_64, data=Dub.voter, bw=bw.lcr2, kernel="bisquare", adaptive=TRUE)
##D if(require("RColorBrewer"))
##D   spplot(gwr.lcr2$SDF,"Local_CN",col.regions=brewer.pal(9,"YlOrRd"),cuts=8,
##D   main="Local CN")
## End(Not run)



