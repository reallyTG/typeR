library(BTYDplus)


### Name: estimateRegularity
### Title: Estimate Regularity in Intertransaction Timings
### Aliases: estimateRegularity

### ** Examples

data("groceryElog")
estimateRegularity(groceryElog, plot = TRUE, method = 'wheat')
estimateRegularity(groceryElog, plot = TRUE, method = 'mle-minka')
estimateRegularity(groceryElog, plot = TRUE, method = 'mle-thom')
estimateRegularity(groceryElog, plot = TRUE, method = 'cv')



