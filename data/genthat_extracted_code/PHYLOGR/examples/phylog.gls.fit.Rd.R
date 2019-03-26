library(PHYLOGR)


### Name: phylog.gls.fit
### Title: Phylogenetically-Based GLS Model Fitting
### Aliases: phylog.gls.fit
### Keywords: models

### ** Examples

data(Lacertid.varcov)
data(Lacertid.Original)
ex.gls.phylog <-
phylog.gls.fit(Lacertid.Original$svl,Lacertid.Original$clutch.size,Lacertid.varcov)
ex.gls.phylog



