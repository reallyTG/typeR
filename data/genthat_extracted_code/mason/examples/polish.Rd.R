library(mason)


### Name: polish
### Title: Do some final polishing of the scrubbed mason analysis data.
### Aliases: polish polish_renaming polish_filter
###   polish_transform_estimates polish_adjust_pvalue

### ** Examples

library(magrittr)
ds <- swiss %>%
 design('glm') %>%
 add_settings() %>%
 add_variables('yvar', c('Fertility', 'Education')) %>%
 add_variables('xvar', c('Agriculture', 'Catholic')) %>%
 add_variables('covariates', 'Examination') %>%
 construct() %>%
 scrub()
polish_renaming(ds, function(x) gsub('Education', 'Schooling', x))
polish_filter(ds, 'Xterm', 'term')
polish_adjust_pvalue(ds)[c('p.value', 'adj.p.value')]
polish_transform_estimates(ds, function(x) exp(x))



