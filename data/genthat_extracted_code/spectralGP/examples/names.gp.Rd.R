library(spectralGP)


### Name: names.gp
### Title: The names of the elements of a GP object
### Aliases: names.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
print(names(gp1))
add.blocks(gp1)
print(names(gp1))




