library(untb)


### Name: etienne
### Title: Etienne's sampling formula
### Aliases: etienne Etienne optimal.params
### Keywords: math

### ** Examples

data(butterflies)
## Not run: optimal.params(butterflies)  #takes too long without PARI/GP


#Now the one from Etienne 2005, supplementary online info:

zoo <- count(c(pigs=1, dogs=1, cats=2, frogs=3, bats=5, slugs=8))
l <- logkda.R(zoo, use.brob=TRUE)  # Use logkda() if pari/gp is available
optimal.params(zoo, log.kda=l)  #compare his answer of 7.047958 and 0.22635923.




