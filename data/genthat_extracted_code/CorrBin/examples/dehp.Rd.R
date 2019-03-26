library(CorrBin)


### Name: dehp
### Title: Developmental toxicology study of DEHP in mice
### Aliases: dehp
### Keywords: datasets

### ** Examples

data(dehp)
library(lattice)
pl <- xyplot(NResp.1/ClusterSize + NResp.2/ClusterSize + NResp.3/ClusterSize ~ Trt, 
        data=dehp, outer=TRUE, type=c("p","a"), jitter.x=TRUE)
pl$condlevels[[1]] <- c("Malformed", "Dead", "Normal")
print(pl)



