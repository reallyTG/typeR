library(ClusterBootstrap)


### Name: confint.clusbootglm
### Title: Confidence intervals for cluster bootstrap model parameters
### Aliases: confint.clusbootglm

### ** Examples

## Not run: 
##D data(opposites)
##D cbglm.1 <- clusbootglm(SCORE~Time*COG,data=opposites,clusterid=Subject)
##D confint(cbglm.1,parm=c("Time","COG"), level=.90, interval.type="percentile")
## End(Not run)



