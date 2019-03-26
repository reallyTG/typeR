library(ddalpha)


### Name: dataf.population
### Title: World Historical Population-by-Country Dataset
### Aliases: dataf.population population
### Keywords: datasets functional

### ** Examples

## load the Population dataset
dataf = dataf.population()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## plot the data
## Not run:
labels = unlist(dataf$labels)
plot(dataf,
  main = "World population data",
  xlab="Year", ylab="Population (in thousands)"
  )
## End(Not run)

## compute the integrated and infimal depths of the data curves
## with respect to the same set of curves
depthf.fd1(dataf$dataf, dataf$dataf)



