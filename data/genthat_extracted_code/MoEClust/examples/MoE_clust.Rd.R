library(MoEClust)


### Name: MoE_clust
### Title: MoEClust: Gaussian Parsimonious Clustering Models with
###   Covariates
### Aliases: MoE_clust print.MoEClust summary.MoEClust
### Keywords: clustering main

### ** Examples

## Not run: 
##D data(ais)
##D hema  <- ais[,3:7]
##D sex   <- ais$sex
##D BMI   <- ais$BMI
##D 
##D # Fit a standard finite mixture model
##D m1    <- MoE_clust(hema, G=2:3)
##D 
##D # Allow covariates to enter the mixing proportions
##D m2    <- MoE_clust(hema, G=2:3, gating= ~ sex + BMI)
##D 
##D # Allow covariates to enter the component densities
##D m3    <- MoE_clust(hema, G=2:3, expert= ~ sex)
##D 
##D # Allow covariates to enter both the gating & expert network
##D m4    <- MoE_clust(hema, G=2:3, gating= ~ BMI, expert= ~ sex)
##D 
##D # Extract the model with highest ICL
##D (comp <- MoE_compare(m1, m2, m3, m4, criterion="icl"))
##D (best <- comp$optimal)
##D (summ <- summary(best))
##D 
##D # Examine the gating and expert networks in greater detail
##D # (but refrain from inferring statistical significance!)
##D summary(best$gating)
##D summary(best$expert)
##D 
##D # Visualise the results, incl. the gating network and log-likelihood
##D plot(best, what="gpairs")
##D plot(best, what="gating")
##D plot(best, what="loglik")
##D 
##D # Visualise the results using the 'lattice' library
##D require("lattice")
##D z     <- factor(best$classification, labels=paste0("Cluster", seq_len(best$G)))
##D splom(~ hema | sex, groups=z)
##D splom(~ hema | z, groups=sex)
## End(Not run)



