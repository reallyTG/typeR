library(ClusterBootstrap)


### Name: coef.clusbootglm
### Title: Obtain coefficients from cluster bootstrap object
### Aliases: coef.clusbootglm

### ** Examples

## Not run: 
##D data(opposites)
##D cbglm.1 <- clusbootglm(SCORE~Time*COG,data=opposites,clusterid=Subject)
##D coef(cbglm.1, estimate.type="bootstrap")
## End(Not run)



