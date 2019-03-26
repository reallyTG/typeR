library(ddalpha)


### Name: dataf.*
### Title: Functional Data Sets
### Aliases: dataf.*
### Keywords: datasets functional

### ** Examples

## load the Growth dataset
dataf = dataf.growth()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## Not run: plot.functional(dataf)



