library(equaltestMI)


### Name: eqMI.main
### Title: The main function to test measurement invariance
### Aliases: eqMI.main

### ** Examples

## Not run: 
##D data(HolzingerSwineford)
##D semmodel<-'
##D L1 =~ V1 + V2 + V3
##D L2 =~ V4 + V5 + V6
##D L3 =~ V7 + V8
##D L4 =~ V9 + V10 + V11
##D '
##D # If raw data are available;
##D 
##D test <- eqMI.main(model = semmodel, data = HolzingerSwineford,
##D         group = "school", meanstructure = TRUE,
##D         output = 'both', quiet = FALSE,
##D         equivalence.test = TRUE, adjRMSEA = TRUE,
##D         projection = TRUE, bootstrap = FALSE)
##D 
##D # when only sample statistics are available;
##D # sample.cov need to be provided for tests of covariance structure;
##D # sample.mean need to be provided for tests of mean structure;
##D 
##D school1 <- subset(HolzingerSwineford, school==1)[,-12]
##D school2 <- subset(HolzingerSwineford, school==2)[,-12]
##D test <- eqMI.main(model = semmodel,
##D         sample.nobs = c(nrow(school1), nrow(school2)),
##D         sample.cov = list(cov(school1), cov(school2)),
##D         sample.mean = list(colMeans(school1), colMeans(school2)),
##D         meanstructure = TRUE, output = 'both', quiet = FALSE,
##D         equivalence.test = TRUE, adjRMSEA = TRUE,
##D         projection = TRUE, bootstrap = FALSE)
## End(Not run)



