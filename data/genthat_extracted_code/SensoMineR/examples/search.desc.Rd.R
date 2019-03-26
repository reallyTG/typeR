library(SensoMineR)


### Name: search.desc
### Title: Search for discriminating descriptors
### Aliases: search.desc
### Keywords: models

### ** Examples

data(chocolates)
## In this example, all the descriptos are discriminated
interesting.desc <- search.desc(sensochoc, col.j = 1, col.p = 4, 
    firstvar = 5, level = 0.5)



