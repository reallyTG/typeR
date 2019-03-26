library(PPforest)


### Name: node_data
### Title: Data structure with the projected and boundary by node and
###   class.
### Aliases: node_data

### ** Examples

#crab data set with all the observations used as training

pprf.crab <- PPforest(data = crab, std =TRUE, class = 'Type',
 size.tr = 1, m = 200, size.p = .5, PPmethod = 'LDA')
node_data(ppf = pprf.crab, tr = 1) 




