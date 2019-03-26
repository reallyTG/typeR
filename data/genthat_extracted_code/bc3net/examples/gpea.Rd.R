library(bc3net)


### Name: gpea
### Title: Gene pair enrichment analysis (GPEA)
### Aliases: gpea

### ** Examples


data(exanet)
data(exgensets) ## example gene sets from the CPDB database (http://www.consensuspathdb.org)

res = gpea(exanet, exgensets, cmax=1000, cmin=2)





