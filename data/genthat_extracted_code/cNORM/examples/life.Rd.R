library(cNORM)


### Name: life
### Title: Life expectancy at birth from 1960 to 2017
### Aliases: life
### Keywords: datasets datasets, expectancy, life series time

### ** Examples

## Not run: 
##D # data preparation
##D data.life <- rankByGroup(life, raw="life")
##D data.life <- computePowers(data.life, age="year")
##D 
##D #determining best suiting model by plotting series
##D model.life <- bestModel(data.life, raw="life")
##D plotPercentileSeries(data.life, model.life, end=10)
##D 
##D # model with four predictors seems to work best
##D model2.life <- bestModel(data.life, raw="life", terms=4)
## End(Not run)



