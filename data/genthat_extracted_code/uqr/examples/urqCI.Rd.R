library(uqr)


### Name: urqCI
### Title: Inference for Unconditional Quantile Regression
### Aliases: urqCI

### ** Examples

### example for cross-sectional data ###

data(engel)
formula=foodexp ~ income
rifreg=urq(formula=formula,data=engel)
summary=urqCI(urq = rifreg,R = 10,graph = TRUE,seed = 1234)

### example for panel data ###

data(trust)
formula=Trust_in_the_ECB~Trust_in_the_EU+Trust_in_National_Government
cre=~Trust_in_the_EU+Trust_in_National_Government
rif=urq(formula,data=trust,cre=cre,id="countryname")
summary=urqCI(urq = rif,R = 10,graph = TRUE,seed = 1234,cluster="countryname")



