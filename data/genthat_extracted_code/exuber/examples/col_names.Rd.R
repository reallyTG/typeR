library(exuber)


### Name: col_names
### Title: Retrieve/Set column names
### Aliases: col_names col_names<-

### ** Examples

## No test: 
# Simulate bubble processes
dta <- cbind(sim_dgp1(n = 100), sim_dgp2(n = 100))

rfd <- radf(x = dta)
col_names(rfd) <- c("OneBubble", "TwoBubbles")
## End(No test)



