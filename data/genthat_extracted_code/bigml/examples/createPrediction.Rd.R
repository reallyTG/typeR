library(bigml)


### Name: createPrediction
### Title: Creating BigML Predictions
### Aliases: createPrediction

### ** Examples

## Not run: 
##D # simple example
##D m1 = createPrediction("model/1",
##D 	input_field_ids = c('000001'='somevalue', '000002'=9999))
##D # configure a number of different parameters
##D m2 = createPrediction("model/2",
##D 	input_field_ids = c('000001'='somevalue', '000002'=9999),
##D 	name='new prediction')
## End(Not run)



