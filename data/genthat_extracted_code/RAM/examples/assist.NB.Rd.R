library(RAM)


### Name: assist.NB
### Title: Negative Binomial Test For OTUID or Taxon
### Aliases: assist.NB
### Keywords: models

### ** Examples

data(ITS1, meta)
m <- meta[, c(2,3,5,7)]
## Not run: 
##D # for usage demonstration purpose only, may not fit the negative
##D # binomial distribution model.
##D nb <- assist.NB(ITS1, meta=m, rank="g", 
##D                 anov.fac="Harvestmethod",
##D                 taxon=rownames(ITS1)[1])
## End(Not run)



