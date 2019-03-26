library(MoEClust)


### Name: as.Mclust
### Title: Convert MoEClust objects to the Mclust class
### Aliases: as.Mclust
### Keywords: utility

### ** Examples

## Not run: 
##D # Fit a gating network mixture of experts model to the ais data
##D data(ais)
##D mod   <- MoE_clust(ais[,3:7], G=1:9, gating= ~ BMI + sex, network.data=ais)
##D 
##D # Convert to the "Mclust" class and examine the classification
##D mod2  <- as.Mclust(mod)
##D plot(mod2, what="classification")
##D 
##D # Examine the uncertainty
##D plot(mod2, what="uncertainty")
##D 
##D # Return the optimal number of clusters according to entropy
##D combi <- mclust::clustCombi(object=mod2)
##D optim <- mclust::clustCombiOptim(combi)
##D table(mod2$classification, ais$sex)
##D table(optim$cluster.combi, ais$sex)
##D 
##D # While we could have just used plot.MoEClust above,
##D # plot.Mclust is especially useful for univariate data
##D data(CO2data)
##D res <- MoE_clust(CO2data$CO2, G=2, expert = ~ GNP, network.data=CO2data)
##D plot(as.Mclust(res))
## End(Not run)



