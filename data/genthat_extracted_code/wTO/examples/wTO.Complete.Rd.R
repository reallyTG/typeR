library(wTO)


### Name: wTO.Complete
### Title: wTO.Complete
### Aliases: wTO.Complete

### ** Examples

## Not run: 
##D # Using spearman rank correlation and bonferroni correction for the pvalues.
##D wTO.Complete( k =8, n = 1000, Data = Microarray_Expression1,
##D  Overlap = ExampleGRF$x, method = "s", pvalmethod = "bonferroni")
##D  # Changing the resampling method to Reshuffle.
##D wTO.Complete( k =1, n = 1000, Data = Microarray_Expression1,
##D Overlap = ExampleGRF$x, method_resampling = "Reshuffle")
##D  # Changing the resampling method to BlockBootstrap, with a lag of 2.
##D  row.names(metagenomics_abundance) = metagenomics_abundance$OTU
##D  metagenomics_abundance = metagenomics_abundance[,-1]
##D wTO.Complete( k =1, n = 1000, Data = metagenomics_abundance, method = "s",
##D Overlap = row.names(metagenomics_abundance), method_resampling = "BlockBootstrap", lag = 2)
##D wTO.Complete( k =2, n = 1000, Data = Microarray_Expression1, method = "s",
##D Overlap = ExampleGRF$x, method_resampling = "BlockBootstrap", ID = rep(1:9,each = 2))
##D X = wTO.Complete( k =1, n = 1000, Data = Microarray_Expression1,
##D Overlap = ExampleGRF$x, method = "p", plot = FALSE)
##D  
## End(Not run)



