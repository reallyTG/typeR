library(themetagenomics)


### Name: est.functions
### Title: Estimate predicted function-topic effects
### Aliases: est.functions est_functions est.hmc est.ml

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'CD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D topics <- find_topics(dat,K=15)
##D 
##D functions <- predict(topics,reference_path='/references/ko_13_5_precalculated.tab.gz')
##D function_effects <- est(functions,level=3,
##D                         iters=500,method='hmc',
##D                         prior=c('laplace','t','laplace'))
## End(Not run)




