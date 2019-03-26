library(RCMIP5)


### Name: cmip5data
### Title: The 'cmip5data' class
### Aliases: cmip5data

### ** Examples

cmip5data(1970)  # produces monthly sample data for year 1970
cmip5data(1970:2014)
cmip5data(1970:2014, monthly=FALSE)  # annual data
cmip5data(1970:2014, randomize=TRUE) # randomized data
cmip5data(1970:2014, Z=TRUE)  # four-dimensional data
cmip5data(0, time=FALSE)  # sample 'fx' data, two-dimensional
cmip5data(list())  # makes this (here empty) list class into 'cmip5data'



