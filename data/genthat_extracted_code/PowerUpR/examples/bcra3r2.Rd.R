library(PowerUpR)


### Name: bcra3r2
### Title: Three-Level Blocked Cluster-level Random Assignment Design,
###   Treatment at Level 2
### Aliases: bcra3r2 mdes.bcra3r2 power.bcra3r2 mrss.bcra3r2

### ** Examples

# cross-checks
mdes.bcra3r2(rho3=.13, rho2=.10, omega3=.4,
             n=10, J=6, K=24)
power.bcra3r2(es = .246, rho3=.13, rho2=.10, omega3=.4,
              n=10, J=6, K=24)
mrss.bcra3r2(es = .246, rho3=.13, rho2=.10, omega3=.4,
             n=10, J=6)



