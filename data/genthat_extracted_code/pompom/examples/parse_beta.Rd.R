library(pompom)


### Name: parse_beta
### Title: Parse the beta from model fit object
### Aliases: parse_beta

### ** Examples

## Don't show: 
data(usemmodelfit)
beta.matrix <- parse_beta(var.number = 3,
                         model.fit = usemmodelfit,
                         lag.order = 1,
                         matrix = TRUE)
beta.matrix
## End(Don't show)
## No test: 
data(usemmodelfit)
beta.matrix <- parse_beta(var.number = 3,
                         model.fit = usemmodelfit,
                         lag.order = 1,
                         matrix = TRUE)
beta.matrix
## End(No test)




