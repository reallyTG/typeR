library(PowerUpR)


### Name: cra4r4
### Title: Four-Level Cluster-randomized Trial
### Aliases: cra4r4 mdes.cra4r4 power.cra4r4 mrss.cra4r4

### ** Examples

# cross-checks
mdes.cra4r4(rho4=.05, rho3=.05, rho2=.10,
            n=10, J=2, K=3, L=20)
power.cra4r4(es = .412, rho4=.05, rho3=.05, rho2=.10,
             n=10, J=2, K=3, L=20)
mrss.cra4r4(es = .412, rho4=.05, rho3=.05, rho2=.10,
            n=10, J=2, K=3)



