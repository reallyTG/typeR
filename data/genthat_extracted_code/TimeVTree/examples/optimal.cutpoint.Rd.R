library(TimeVTree)


### Name: optimal.cutpoint
### Title: Function to Find the First Cutpoint and its P Value
### Aliases: optimal.cutpoint

### ** Examples

##Call in alcohol data set
data('alcohol')
require(survival)

coxtree <- optimal.cutpoint(alcohol[,'time'], alcohol[,'event'], 
                      x = alcohol[,'alc', drop = FALSE])



