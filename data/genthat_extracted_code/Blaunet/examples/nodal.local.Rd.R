library(Blaunet)


### Name: nodal.local
### Title: Computes Blau statuses for individuals with respect to a primary
###   membership
### Aliases: nodal.local

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
#will automatically compute niches
b0 <- nodal.local(b, dev.range = rep(1.5, 10), focal.niche = 'grppta') 
# 10 is the number of dimensions in the command line above 




