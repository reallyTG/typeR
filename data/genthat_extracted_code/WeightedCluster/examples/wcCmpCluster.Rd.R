library(WeightedCluster)


### Name: wcCmpCluster
### Title: Automatic comparison of clustering methods.
### Aliases: wcCmpCluster print.clustrangefamily plot.clustrangefamily
###   summary.clustrangefamily

### ** Examples

data(mvad)

#Creating state sequence object
mvad.seq <- seqdef(mvad[, 17:86])

# COmpute distance using Hamming distance
diss <- seqdist(mvad.seq, method="HAM")

#Ward clustering
allClust <- wcCmpCluster(diss, maxcluster=15, method=c("average", "pam", "beta.flexible"), 
                         pam.combine=FALSE)

summary(allClust, max.rank=3)

##Plot PBC, RHC and ASW
plot(allClust, stat=c("PBC", "RHC", "ASW"), norm="zscore", lwd=2)


##Plot PBC, RHC and ASW grouped by cluster method
plot(allClust, group="method", stat=c("PBC", "RHC", "ASW"), norm="zscore", lwd=2)



