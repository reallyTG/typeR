library(caper)


### Name: IsaacEtAl
### Title: Example dataset for the caper package
### Aliases: IsaacEtAl chiroptera.tree carnivora.tree primates.tree
###   marsupialia.tree chiroptera.data carnivora.data primates.data
###   marsupialia.data
### Keywords: datasets

### ** Examples

data(IsaacEtAl)
chiroptera  <- comparative.data(chiroptera.tree, chiroptera.data, 'binomial', na.omit=FALSE)
carnivora   <- comparative.data(carnivora.tree, carnivora.data, 'binomial', na.omit=FALSE)
primates    <- comparative.data(primates.tree, primates.data, 'binomial', na.omit=FALSE)
marsupialia <- comparative.data(marsupialia.tree, marsupialia.data, 'binomial', na.omit=FALSE)
	



