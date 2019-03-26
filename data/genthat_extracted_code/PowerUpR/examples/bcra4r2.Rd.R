library(PowerUpR)


### Name: bcra4r2
### Title: Four-Level Blocked Cluster-level Random Assignment Design,
###   Treatment at Level 2
### Aliases: bcra4r2 mdes.bcra4r2 power.bcra4r2 mrss.bcra4r2

### ** Examples

# cross-checks
mdes.bcra4r2(rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, omega3=.50, n=10, J=4, K=4, L=20)
power.bcra4r2(es = .206, rho4=.05, rho3=.15, rho2=.15,
              omega4=.50, omega3=.50, n=10, J=4, K=4, L=20)
mrss.bcra4r2(es = .206, rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, omega3=.50, n=10, J=4, K=4)



