library(themetagenomics)


### Name: predict.topics
### Title: Predict topic functional content
### Aliases: predict.topics predict_functions predict.functions
###   predict_topics

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'Not IBD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D topics <- find_topics(dat,K=15)
##D 
##D download_ref(destination='/references',reference='gg_ko')
##D functions <- predict(topics,reference='gg_ko',
##D                      reference_path='/references')
## End(Not run)




