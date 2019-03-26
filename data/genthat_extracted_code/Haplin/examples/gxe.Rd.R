library(Haplin)


### Name: gxe
### Title: Test for gene-environment interaction
### Aliases: gxe

### ** Examples


## Not run: 
##D # All standard haplin runs can be done with haplinStrat. 
##D # Below is an illustration. See the haplin help page for more 
##D # examples.
##D # 
##D # Analyzing the effect of fetal genes, including triads with missing data,
##D # using a multiplicative response model. The first column of the data file
##D # in this example contains the stratification variable.
##D result <- haplinStrat("C:/work/data.dat", strata = 1, use.missing = T, response = "mult",
##D reference = "ref.cat", winlength = 1)
##D # Provide summary of separate results:
##D lapply(result, summary)
##D # Plot results separately:
##D par(ask = T)
##D lapply(result, plot)
##D #
##D # Convert results to table format and stack them over strata:
##D haptable(result)
##D # Test for interaction between haplotype risk estimates and the strata variable:
##D gxe(result)
##D 
##D 
##D 
##D 
## End(Not run)




