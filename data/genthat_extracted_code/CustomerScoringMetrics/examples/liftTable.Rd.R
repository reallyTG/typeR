library(CustomerScoringMetrics)


### Name: liftTable
### Title: Calculate lift table
### Aliases: liftTable

### ** Examples

## Load response modeling predictions
data("response")
## Apply liftTable function to obtain lift table for test sample results and print
## results
lt<-liftTable(response$test[,2],response$test[,1])
print(lt)




