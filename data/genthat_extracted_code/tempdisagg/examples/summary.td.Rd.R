library(tempdisagg)


### Name: summary.td
### Title: Summary of a Temporal Disaggregation
### Aliases: print.summary.td summary.td
### Keywords: models ts,

### ** Examples

data(swisspharma)
  
mod1 <- td(sales.a ~ imports.q + exports.q)
summary(mod1)  
  
mod2 <- td(sales.a ~ 0, to = "quarterly", method = "uniform")
summary(mod2)
  



