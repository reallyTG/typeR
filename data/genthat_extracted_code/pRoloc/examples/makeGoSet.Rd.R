library(pRoloc)


### Name: makeGoSet
### Title: Creates a GO feature 'MSnSet'
### Aliases: makeGoSet

### ** Examples

library("pRolocdata")
data(dunkley2006)
data(dunkley2006params)
goset <- makeGoSet(dunkley2006[1:10, ],
                   dunkley2006params)
goset
exprs(goset)[1:10, 1:5]
image(goset)



