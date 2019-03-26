library(canprot)


### Name: rankplot
### Title: Plot Ranking of Chemical Affinities
### Aliases: rankplot

### ** Examples

data(canprot)
pdat <- get_pdat("JKMF10")
rankplot(pdat, res=25)
rankplot(pdat, res=25, what="affinity")



