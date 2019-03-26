library(themetagenomics)


### Name: resume
### Title: Resume HMC using a previous fit
### Aliases: resume resume.effects

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'Not IBD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D topics <- find_topics(dat,K=15)
##D 
##D functions <- predict(topics,reference_path='/references/ko_13_5_precalculated.tab.gz')
##D 
##D function_effects_init <- est(functions,level=3,iters=150,
##D                              prior=c('laplace','t','laplace'))
##D function_effects <- resume(function_effects_init,init_type='last',
##D                            iters=300,chains=4)
## End(Not run)




