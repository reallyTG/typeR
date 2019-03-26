library(dfcrm)


### Name: crmsens
### Title: Model Sensitivity in the CRM
### Aliases: crmsens print.dxcrm
### Keywords: datasets

### ** Examples

prior <- c(0.05, 0.10, 0.20, 0.35, 0.50, 0.70)
target <- 0.2
foo <- crmsens(prior, target, model="logistic", intcpt=2, detail=TRUE)



