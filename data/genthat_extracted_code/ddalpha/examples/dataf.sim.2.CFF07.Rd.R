library(ddalpha)


### Name: dataf.sim.2.CFF07
### Title: Model 2 from Cuevas et al. (2007)
### Aliases: dataf.sim.2.CFF07
### Keywords: datasets functional

### ** Examples

## load the dataset
dataf = dataf.sim.2.CFF07(numTrain = 100, numTest = 50, numDiscrets = 51)
learn = dataf$learn
test = dataf$test

## view the classes
unique(learn$labels)

## access the 5th point of the 2nd object
learn$dataf[[2]]$args[5]
learn$dataf[[2]]$vals[5]

## Not run: 
##D ## plot the data
##D plot(learn)
##D plot(test)
##D 
##D ## or
##D dataf = dataf.sim.2.CFF07(numTrain = 100, numTest = 50, numDiscrets = 51, plot = TRUE)
## End(Not run)




