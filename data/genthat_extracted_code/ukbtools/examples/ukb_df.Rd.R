library(ukbtools)


### Name: ukb_df
### Title: Reads a UK Biobank phenotype fileset and returns a single
###   dataset.
### Aliases: ukb_df

### ** Examples

## Not run: 
##D # Simply provide the stem of the UKB fileset.
##D # To read ukb1234.tab, ukb1234.r, ukb1234.html
##D 
##D my_ukb_data <- ukb_df("ukb1234")
##D 
##D 
##D If you have multiple UKB filesets, tidy then merge.
##D 
##D ukb1234_data <- ukb_df("ukb1234")
##D ukb2345_data <- ukb_df("ukb2345")
##D ukb3456_data <- ukb_df("ukb3456")
##D 
##D my_ukb_data <- plyr::join_all(
##D   list(ukb1234_data, ukb2345_data, ukb3456_data),
##D   by = "eid",
##D   type = "full"
##D )
## End(Not run)




