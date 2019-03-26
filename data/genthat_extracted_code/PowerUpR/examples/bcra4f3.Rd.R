library(PowerUpR)


### Name: bcra4f3
### Title: Four-Level Blocked (Fixed) Cluster-level Random Assignment
###   Design, Treatment at Level 3
### Aliases: bcra4f3 mdes.bcra4f3 power.bcra4f3 mrss.bcra4f3

### ** Examples

# cross-checks
mdes.bcra4f3(rho3=.15, rho2=.15,
             n=10, J=4, K=4, L=15)
power.bcra4f3(es=0.339, rho3=.15, rho2=.15,
              n=10, J=4, K=4, L=15)
mrss.bcra4f3(es=0.339, rho3=.15, rho2=.15,
             n=10, J=4, K=4)



