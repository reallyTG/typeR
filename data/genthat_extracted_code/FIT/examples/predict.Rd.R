library(FIT)


### Name: predict
### Title: Predicts gene expressions using pretrained models.
### Aliases: predict

### ** Examples

## Not run: 
##D # prepare models
##D # NOTE: FIT::train() returns a nested list of models
##D #   so we have to flatten it using FIT::train.to.predict.adaptor()
##D #   before passing it to FIT::predict().
##D models <- FIT::train(..)
##D models.flattened <- FIT::train.to.predict.adaptor(models)
##D 
##D # load data used for prediction
##D prediction.attribute  <- FIT::load.attribute('attribute.2009.txt')
##D prediction.weather    <- FIT::load.weather('weather.2009.dat', 'weather')
##D prediction.expression <- FIT::load.expression('expression.2009.dat', 'ex', genes)
##D 
##D prediction.results <- FIT::predict(models.flattened,
##D                                    prediction.attribute,
##D                                    prediction.weather)
## End(Not run)



