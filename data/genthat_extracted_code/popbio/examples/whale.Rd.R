library(popbio)


### Name: whale
### Title: Projection matrix for killer whale
### Aliases: whale
### Keywords: datasets

### ** Examples

data(whale)
whale
splitA(whale)
lambda(whale)
sensitivity(whale)
# plot sensitivity 
matplot2(sensitivity(whale), type='b', legend='topleft', ltitle='Fate',
main='Killer Whale sensitivity')





