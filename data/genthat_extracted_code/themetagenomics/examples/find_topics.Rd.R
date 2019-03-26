library(themetagenomics)


### Name: find_topics
### Title: Perform topic estimation on a themetadata object
### Aliases: find_topics

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'Not IBD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D topics <- find_topics(dat,K=15)
## End(Not run)




