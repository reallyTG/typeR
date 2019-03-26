library(ClusterBootstrap)


### Name: summary.clusbootglm
### Title: Summarize output of cluster bootstrap GLM
### Aliases: summary.clusbootglm

### ** Examples

## Not run: 
##D data(opposites)
##D cbglm.1 <- clusbootglm(SCORE~Time*COG,data=opposites,clusterid=Subject)
##D summary(cbglm.1, interval.type="percentile")
## End(Not run)



