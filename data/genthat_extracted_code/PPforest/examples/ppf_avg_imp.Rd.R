library(PPforest)


### Name: ppf_avg_imp
### Title: Global importance measure for a PPforest object as the average
###   IMP PPtree measure over all the trees in the forest
### Aliases: ppf_avg_imp

### ** Examples

#crab data set with all the observations used as training

pprf.crab <- PPforest(data = crab, std =TRUE, class = 'Type',
 size.tr = 1, m = 100, size.p = .5, PPmethod = 'LDA')
 ppf_avg_imp(pprf.crab, 'Type') 
 



