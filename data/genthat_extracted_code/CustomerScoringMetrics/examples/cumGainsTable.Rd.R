library(CustomerScoringMetrics)


### Name: cumGainsTable
### Title: Calculates cumulative gains table
### Aliases: cumGainsTable

### ** Examples

## Load response modeling predictions
data("response")
## Apply cumGainsTable function to obtain cumulative gains table for test sample results
## and print results
cgt<-cumGainsTable(response$test[,2],response$test[,1])
print(cgt)




