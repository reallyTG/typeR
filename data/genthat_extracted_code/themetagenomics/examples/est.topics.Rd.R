library(themetagenomics)


### Name: est.topics
### Title: Estimate topic effects
### Aliases: est.topics est_topics

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'CD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D topics <- find_topics(dat,K=15)
##D topic_effects <- est(topics)
## End(Not run)




