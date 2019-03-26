library(mem)


### Name: memgoodness
### Title: Goodness of fit of the mem
### Aliases: memgoodness
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# Goodness of fit
epi.good<-memgoodness(flucyl,i.detection.values=seq(2.5,2.8,0.1))
epi.good$results
epi.good$peaks




