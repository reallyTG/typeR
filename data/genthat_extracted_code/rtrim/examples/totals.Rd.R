library(rtrim)


### Name: totals
### Title: Extract time-totals from TRIM output
### Aliases: totals

### ** Examples

data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2, changepoints=c(3,5))
totals(z)

totals(z, "both") # mimics classic TRIM




