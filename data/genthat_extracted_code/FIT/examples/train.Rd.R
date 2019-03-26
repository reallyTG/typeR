library(FIT)


### Name: train
### Title: Constructs models following a recipe.
### Aliases: train

### ** Examples

## Not run: 
##D # create recipe
##D recipe <- FIT::make.recipe(..)
##D 
##D #load training data
##D training.attribute  <- FIT::load.attribute('attribute.2008.txt');
##D training.weather    <- FIT::load.weather('weather.2008.dat', 'weather')
##D training.expression <- FIT::load.expression('expression.2008.dat', 'ex', genes)
##D training.weight     <- FIT::load.weight('weight.2008.dat', 'weight', genes)
##D 
##D # train models
##D models <- FIT::train(training.expression,
##D                      training.attribute,
##D                      training.weather,
##D                      recipe,
##D                      training.weight)
## End(Not run)



