library(CustomerScoringMetrics)


### Name: response
### Title: response data
### Aliases: response
### Keywords: datasets

### ** Examples

# Load data
data(response)
# Calculate incidence in test sample
print(sum(response$test[,1]=="cl1")/nrow(response$test))



