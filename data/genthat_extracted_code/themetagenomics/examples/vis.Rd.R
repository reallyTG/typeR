library(themetagenomics)


### Name: vis
### Title: Launch in interactive visualize to explore topic effects
### Aliases: vis vis.effects vis.binary vis.continuous vis.functions
###   vis.taxa vis.topics

### ** Examples

formula <- ~DIAGNOSIS
refs <- 'Not IBD'

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D vis(topic_effects,type='taxa')
##D vis(topic_effects,type='binary')
## End(Not run)

formula <- ~PCDAI

dat <- prepare_data(otu_table=GEVERS$OTU,rows_are_taxa=FALSE,tax_table=GEVERS$TAX,
                    metadata=GEVERS$META,formula=formula,refs=refs,
                    cn_normalize=TRUE,drop=TRUE)

## Not run: 
##D vis(topic_effects,type='continuous')
##D 
##D functions <- predict(topics,reference_path='/references/ko_13_5_precalculated.tab.gz')
##D 
##D function_effects <- est(functions,level=3,
##D                         iters=500,method='hmc',
##D                         prior=c('laplace','t','laplace'))
##D 
##D vis(function_effects,topic_effects)
## End(Not run)



