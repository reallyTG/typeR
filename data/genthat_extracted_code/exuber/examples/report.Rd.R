library(exuber)


### Name: report
### Title: Report summary statistics, diagnostics and date stamping periods
###   of mildly explosive behaviour.
### Aliases: report diagnostics datestamp

### ** Examples

## No test: 
# Simulate bubble processes, compute the t-stat and critical values
set.seed(4441)
dta <- cbind(sim_dgp1(n = 100), sim_dgp2(n = 100))
rfd <- radf(dta)
mc <- mc_cv(n = 100)

# Report, diagnostics and datestamp (default)
report(x = rfd, y = mc)
diagnostics(x = rfd, y = mc)
datestamp(x = rfd, y = mc)

# Diagnostics for 'sadf'
diagnostics(x = rfd, y = mc, option = "sadf")

# Use rule of thumb to omit periods of explosiveness which are short-lived
rot = round(log(NROW(rfd)))
datestamp(x = rfd, y = mc, min_duration = rot)
## End(No test)



