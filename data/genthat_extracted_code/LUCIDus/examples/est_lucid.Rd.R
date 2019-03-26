library(LUCIDus)


### Name: est_lucid
### Title: Estimating latent clusters with multi-omics data
### Aliases: est_lucid
### Keywords: cluster latent

### ** Examples

# Integrative clustering without feature selection
set.seed(10)
IntClusFit <- est_lucid(G=G1,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)

## Not run: 
##D # Re-run the model with covariates in the G->X path
##D IntClusCoFit1 <- est_lucid(G=G1,CoG=CoG,Z=Z1,Y=Y1,K=2,family="binary",Pred=TRUE)
##D 
##D # Re-run the model with covariates in the X->Y path
##D IntClusCoFit2 <- est_lucid(G=G1,Z=Z1,Y=Y1,CoY=CoY,K=2,family="binary",Pred=TRUE)
##D 
##D # Re-run the model with covariates in both G->X and X->Y paths
##D IntClusCoFit3 <- est_lucid(G=G1,CoG=CoG,Z=Z1,Y=Y1,CoY=CoY,K=2,family="binary",Pred=TRUE)
## End(Not run)



