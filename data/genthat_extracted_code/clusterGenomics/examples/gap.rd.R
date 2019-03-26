library(clusterGenomics)


### Name: gap
### Title: The gap statistic
### Aliases: gap

### ** Examples

#Load a simulated data set with 5 clusters
data(exData1)
X = exData1$X
groups = exData1$groups

#Run gap (limit the number of reference data sets to decrease computing time):
res <- gap(X, B=10)

#Compare predicted groups to true groups:
cbind(res$lab.hatK, groups)

#Plot the total within-cluster dispersion and the gap-curve +/- standard errors:
par(mfrow=c(2,1))
plot(1:length(res$W), res$W, type="b")
plot(1:length(res$gap), res$gap, type="b", ylim=c(min(res$gap-res$sk),
max(res$gap+res$sk)), pch=19)
points(1:length(res$sk), res$gap+res$sk, cex=0.7, pch=8)
points(1:length(res$sk), res$gap-res$sk, cex=0.7, pch=8)
segments(x0=1:length(res$sk), y0=res$gap-res$sk, y1=res$gap+res$sk)




