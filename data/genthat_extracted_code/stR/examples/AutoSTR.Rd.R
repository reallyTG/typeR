library(stR)


### Name: AutoSTR
### Title: Automatic STR decomposition for time series data
### Aliases: AutoSTR

### ** Examples

## No test: 

# Decomposition of a multiple seasonal time series
decomp <- AutoSTR(calls)
plot(decomp)

# Decomposition of a monthly time series
decomp <- AutoSTR(log(grocery))
plot(decomp)
## End(No test)



