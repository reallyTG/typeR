library(meteR)


### Name: meteDist2Rank
### Title: meteDist2Rank
### Aliases: meteDist2Rank

### ** Examples

data(arth)
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
sad1 <- sad(esf1)
meteDist2Rank(sad1)



