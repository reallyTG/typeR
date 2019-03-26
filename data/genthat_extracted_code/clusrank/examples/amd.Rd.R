library(clusrank)


### Name: amd
### Title: CARMS scores
### Aliases: amd
### Keywords: datasets

### ** Examples

data(amd)
clusWilcox.test(CARMS ~ Variant + cluster(ID), data = amd,
               subset = CARMS %in% c(1, 2, 3, 4), method = "rgl", alternative = "two")
clusWilcox.test(CARMS ~ Variant + cluster(ID), data = amd,
               subset = CARMS %in% c(1, 2, 3, 4), method = "ds", alternative = "two")
clusWilcox.test(CARMS ~ Variant + cluster(ID) + stratum(AgeSex), data = amd,
               subset = CARMS %in% c(1, 2, 3, 4), alternative = "two")



