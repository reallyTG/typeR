library(Power2Stage)


### Name: power.tsd.in
### Title: Power calculation of adaptive 2-stage BE studies with 2x2
###   crossover design, based on the Inverse Normal method
### Aliases: power.2stage.in power.tsd.in

### ** Examples

# 12 subjects in stage 1, CV of 20%, no futility rule, otherwise all defaults
# except too low number of sims due to CRAN policy for run-time of examples
# This setting resembles values in Table 6.8 and 6.10 in Patterson and Jones
# if nsims=1e5 (default)
power.tsd.in(n1 = 12, CV = 0.2, fCrit = "No", nsims=1e4)

# Note that actual replication would require the following additional
# arguments (extremely long run-time)
## Not run: 
##D power.tsd.in(n1 = 12, CV = 0.2, fCrit = "No", max.n = 4000, 
##D              pmethod = "exact", nsims = 1E6)
## End(Not run)

# Table 8 in Maurer et al
power.tsd.in(n1 = 36, CV = 0.4, max.n = 4000)

# Same example as before but with additional futility criterion regarding
# maximum sample size (using the default 4*n1 as maximum bound)
power.tsd.in(n1 = 36, CV = 0.4, max.n = 4000, fCrit = c("CI", "Nmax"))



