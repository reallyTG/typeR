library(CustomerScoringMetrics)


### Name: topDecileLift
### Title: Calculate top-decile lift
### Aliases: topDecileLift

### ** Examples

## Load response modeling predictions
data("response")
## Calculate top-decile lift for test sample results
tdl<-topDecileLift(response$test[,2],response$test[,1])
print(tdl)




