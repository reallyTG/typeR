library(themetagenomics)


### Name: prepare_data
### Title: Prepare themetadata object from data for topic modeling pipeline
### Aliases: prepare_data

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'Not IBD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)



