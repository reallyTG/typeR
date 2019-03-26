library(rtrim)


### Name: confint.trim
### Title: Compute time-totals confidence interval
### Aliases: confint.trim

### ** Examples

data(skylark2)
z <- trim(count ~ site + year, data=skylark2, model=3)
CI <- confint(z)



