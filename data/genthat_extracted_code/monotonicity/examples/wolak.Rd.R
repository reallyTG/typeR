library(monotonicity)


### Name: wolak
### Title: Testing inequality constraints in linear econometric models
### Aliases: wolak

### ** Examples

## load demo data and apply Wolak tests
## No test: 
data(demo_returns)
tmp <- wolak(demo_returns)
tmp$TestOnePvalueWolak
## End(No test)
## transform existing data (asset returns) into difference returns before applying wolak()
## as data is finally in difference returns, appy wolak() with difference = TRUE

## No test: 
data <- demo_returns[, 2:ncol(demo_returns)] - (demo_returns[, 1:(ncol(demo_returns) - 1)])
wolak(data, difference = TRUE)
## End(No test)



