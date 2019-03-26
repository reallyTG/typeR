library(PowerUpR)


### Name: bira3r1
### Title: Three-Level Blocked Individual-level Random Assignment Design,
###   Treatment at Level 1
### Aliases: bira3r1 mdes.bira3r1 power.bira3r1 mrss.bira3r1

### ** Examples

# cross-checks
mdes.bira3r1(rho3=.20, rho2=.15,
             omega3=.10, omega2=.10,
             n=69, J=10, K=100)
power.bira3r1(es = .045, rho3=.20, rho2=.15,
              omega3=.10, omega2=.10,
              n=69, J=10, K=100)
mrss.bira3r1(es = .045, rho3=.20, rho2=.15,
             omega3=.10, omega2=.10,
             n=69, J=10)



