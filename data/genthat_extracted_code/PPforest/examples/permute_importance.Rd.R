library(PPforest)


### Name: permute_importance
### Title: Obtain the permuted importance variable measure
### Aliases: permute_importance

### ** Examples

pprf.crab <- PPforest(data = crab, class = 'Type',
std = TRUE, size.tr = 1, m = 100, size.p = .4, PPmethod = 'LDA', parallel = TRUE, core = 2)
permute_importance(ppf = pprf.crab) 




