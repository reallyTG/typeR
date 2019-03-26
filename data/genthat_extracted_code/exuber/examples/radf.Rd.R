library(exuber)


### Name: radf
### Title: Recursive Augmented Dickey-Fuller test
### Aliases: radf

### ** Examples

## No test: 
# Simulate bubble processes
dta <- cbind(sim_dgp1(n = 100), sim_dgp2(n = 100))

rfd <- radf(x = dta)

# For lag = 1 and minimum window = 20
rfd <- radf(x = dta, minw = 20, lag = 1)
## End(No test)



