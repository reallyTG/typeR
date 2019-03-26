library(jtools)


### Name: svysd
### Title: Calculate standard deviations with complex survey data
### Aliases: svysd

### ** Examples

if (requireNamespace("survey")) {
 library(survey)
 data(api)
 # Create survey design object
 dstrat <- svydesign(id = ~1,strata = ~stype, weights = ~pw, data = apistrat,
                     fpc=~fpc)

 # Print the standard deviation of some variables
 svysd(~api00+ell+meals, design = dstrat)
}




