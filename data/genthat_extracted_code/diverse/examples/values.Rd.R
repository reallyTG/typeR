library(diverse)


### Name: values
### Title: Pre-process the raw data
### Aliases: values

### ** Examples

#raw values
values(data=pantheon)
values(data = scidat)
#proportions
values(data = scidat, norm='p')
#revealed comparative advantages
values(data = scidat, norm='rca')
values(data = scidat, norm='rca', filter=1)
values(data = scidat, norm='rca', filter=1, binary=TRUE)



