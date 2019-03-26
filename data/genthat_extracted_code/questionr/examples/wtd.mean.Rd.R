library(questionr)


### Name: wtd.mean
### Title: Weighted mean and variance of a vector
### Aliases: wtd.mean wtd.var

### ** Examples

data(hdv2003)
mean(hdv2003$age)
wtd.mean(hdv2003$age, weights=hdv2003$poids)
var(hdv2003$age)
wtd.var(hdv2003$age, weights=hdv2003$poids)



