library(EffectStars)


### Name: plebiscite
### Title: Chilean Plebiscite
### Aliases: plebiscite
### Keywords: datasets multinomial response

### ** Examples

## Not run: 
##D data(plebiscite)
##D plebiscite$Population <- scale(plebiscite$Population)
##D plebiscite$Age <- scale(plebiscite$Age)
##D plebiscite$Income <- scale(plebiscite$Income)
##D 
##D star.nominal(Vote ~ SantiagoCity + Population + Gender + Age + Education + 
##D Income, data = plebiscite)
## End(Not run)



