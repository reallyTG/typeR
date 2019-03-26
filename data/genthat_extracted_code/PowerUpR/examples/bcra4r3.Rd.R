library(PowerUpR)


### Name: bcra4r3
### Title: Four-Level Blocked Cluster-level Random Assignment Design,
###   Treatment at Level 3
### Aliases: bcra4r3 mdes.bcra4r3 power.bcra4r3 mrss.bcra4r3

### ** Examples

# cross-checks
mdes.bcra4r3(rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, n=10, J=4, K=4, L=20)
power.bcra4r3(es = .316, rho4=.05, rho3=.15, rho2=.15,
              omega4=.50, n=10, J=4, K=4, L=20)
mrss.bcra4r3(es = .316, rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, n=10, J=4, K=4)



