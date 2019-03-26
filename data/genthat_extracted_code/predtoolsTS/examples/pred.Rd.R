library(predtoolsTS)


### Name: pred
### Title: Predictions
### Aliases: pred

### ** Examples

prediction <- pred(model=modl(prep(AirPassengers)),n.ahead=25)
pred(tserie=prediction$tserie, predictions=prediction$predictions)



