library(ADCT)


### Name: OneArm.CondPower
### Title: Conditional power for one-arm, two-stage design with two primary
###   endpoints
### Aliases: OneArm.CondPower

### ** Examples

# Example in Chang (2014) page  277
OneArm.CondPower(mu1=0.1333, mu2=0.1605, n1=130, n2=130, rho=0.35,
 tau=0.5, alpha2=0.024, alternative = "one.sided")
OneArm.CondPower(mu1=0.1333, mu2=0.1605, n1=130, n2=414, rho=0.35,
 tau=0.5, alpha2=0.024, alternative = "one.sided")



