library(CustomerScoringMetrics)


### Name: liftIndex
### Title: Calculate lift index
### Aliases: liftIndex

### ** Examples

## Load response modeling predictions
data("response")
## Calculate lift index for test sample results
li<-liftIndex(response$test[,2],response$test[,1])
print(li)




