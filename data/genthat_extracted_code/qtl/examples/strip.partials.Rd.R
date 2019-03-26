library(qtl)


### Name: strip.partials
### Title: Strip partially informative genotypes
### Aliases: strip.partials
### Keywords: manip

### ** Examples

data(listeria)
sum(nmissing(listeria))
listeria <- strip.partials(listeria)
sum(nmissing(listeria))



