library(provenance)


### Name: ternary.ellipse
### Title: Ternary confidence ellipse
### Aliases: ternary.ellipse ternary.ellipse.default
###   ternary.ellipse.compositional ternary.ellipse.counts

### ** Examples

data(Namib)
tern <- ternary(Namib$Major,'CaO','Na2O','K2O')
plot(tern)
ternary.ellipse(tern)



