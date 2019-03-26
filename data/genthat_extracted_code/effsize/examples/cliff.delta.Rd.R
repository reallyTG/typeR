library(effsize)


### Name: cliff.delta
### Title: Cliff's Delta effect size for ordinal variables
### Aliases: cliff.delta cliff.delta.default cliff.delta.formula
### Keywords: effect size Cliff

### ** Examples

## Example data from Hogarty and Kromrey (1999)
treatment <- c(10,10,20,20,20,30,30,30,40,50)
control <- c(10,20,30,40,40,50)
res = cliff.delta(treatment,control,return.dm=TRUE)
print(res)
print(res$dm)



