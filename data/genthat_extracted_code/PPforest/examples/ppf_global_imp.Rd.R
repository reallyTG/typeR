library(PPforest)


### Name: ppf_global_imp
### Title: Global importance measure for a PPforest object
### Aliases: ppf_global_imp

### ** Examples

#crab data set with all the observations used as training

pprf.crab <- PPforest(data = crab, std = TRUE, class = 'Type',
 size.tr = 1, m = 200, size.p = .5, PPmethod = 'LDA', parallel = TRUE, cores = 2)
 
ppf_global_imp(data = crab, class = 'Type', pprf.crab) 




