library(uqr)


### Name: urq
### Title: Unconditional Quantile Regression
### Aliases: urq

### ** Examples

### example for cross-sectional data ###

data(engel)
formula = foodexp ~ income
rifreg=urq(formula,data = engel)

### example for panel data ###

data(trust)
formula=Trust_in_the_ECB~Trust_in_the_EU+Trust_in_National_Government
cre=~Trust_in_the_EU+Trust_in_National_Government
rif=urq(formula,data=trust,cre=cre,id="countryname")



