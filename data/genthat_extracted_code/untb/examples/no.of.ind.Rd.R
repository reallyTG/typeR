library(untb)


### Name: no.of.ind
### Title: Ecosystem diagnostics
### Aliases: no.of.ind no.of.spp no.of.singletons no.of.extinct
###   maximal.abundance singletons extinct extant
### Keywords: math

### ** Examples

data(butterflies)
no.of.spp(butterflies)
no.of.ind(butterflies)

jj1 <- count(c(dogs=7,pigs=3,crabs=1,slugs=1))
jj2 <- count(c(squid=0,octopus=0,nautilus=0))
jj3 <- count(c(bugs=3,rats=1,crabs=0,fish=0))

extinct(jj1 + jj2) 
extinct(jj3)               #cats 'n' fish
extant(jj3)                #bugs and rats

singletons(jj1)
singletons(jj2)           # empty 
singletons(jj1 + jj3)     # crabs, rats and slugs




