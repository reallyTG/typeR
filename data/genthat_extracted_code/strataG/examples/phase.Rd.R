library(strataG)


### Name: phase
### Title: PHASE
### Aliases: phase phaseReadSample phaseReadPair phaseWrite phasePosterior
###   phaseFilter

### ** Examples

## Not run: 
##D data(bowhead.snps)
##D data(bowhead.snp.position)
##D snps <- df2gtypes(bowhead.snps, ploidy = 2, description = "Bowhead SNPS")
##D summary(snps)
##D 
##D # Run PHASE on all data
##D phase.results <- phase(snps, bowhead.snp.position, num.iter = 100, 
##D   save.posterior = FALSE)
##D 
##D # Filter phase results
##D filtered.results <- phaseFilter(phase.results, thresh = 0.5)
##D 
##D # Convert phased genotypes to gtypes
##D ids <- rownames(filtered.results)
##D strata <- bowhead.snps$Stock[match(ids, bowhead.snps$LABID)]
##D filtered.df <- cbind(id = ids, strata = strata, filtered.results)
##D phased.snps <- df2gtypes(filtered.df, ploidy = 2, description = "Bowhead phased SNPs")
##D summary(phased.snps)
## End(Not run)




