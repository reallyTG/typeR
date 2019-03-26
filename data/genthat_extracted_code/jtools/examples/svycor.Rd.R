library(jtools)


### Name: svycor
### Title: Calculate Pearson correlations with complex survey data
### Aliases: svycor

### ** Examples

if (requireNamespace("survey")) {
 library(survey)
 data(api)
 # Create survey design object
 dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw,
                     data = apistrat, fpc = ~fpc)

 # Print correlation matrix
 svycor(~api00 + api99 + dnum, design = dstrat)

 # Save the results, extract correlation matrix
 out <- svycor(~api00 + api99 + dnum, design = dstrat)
 out$cors

}




