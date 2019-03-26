library(PowerUpR)


### Name: bira4r1
### Title: Four-Level Blocked Individual-level Random Assignment Design,
###   Treatment at Level 1
### Aliases: bira4r1 mdes.bira4r1 power.bira4r1 mrss.bira4r1

### ** Examples

# cross-checks
mdes.bira4r1(rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, omega3=.50, omega2=.50,
             n=10, J=4, K=4, L=27)
power.bira4r1(es = 0.142, rho4=.05, rho3=.15, rho2=.15,
              omega4=.50, omega3=.50, omega2=.50,
              n=10, J=4, K=4, L=27)
mrss.bira4r1(es = 0.142, rho4=.05, rho3=.15, rho2=.15,
             omega4=.50, omega3=.50, omega2=.50,
             n=10, J=4, K=4)



