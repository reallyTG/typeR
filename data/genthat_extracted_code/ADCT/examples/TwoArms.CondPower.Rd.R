library(ADCT)


### Name: TwoArms.CondPower
### Title: Conditional power for two-group design, two-stage design with
###   two primary endpoints
### Aliases: TwoArms.CondPower

### ** Examples

# Example in Chang (2014) page  278
TwoArms.CondPower(mu1=0.28, sigma1=1.9, mu2=0.35, sigma2=2.2, n1=340, n2=340,
rho=0.3, tau=0.5, alpha2=0.024, alternative = "one.sided")
TwoArms.CondPower(mu1=0.28, sigma1=1.9, mu2=0.35, sigma2=2.2, n1=340, n2=482,
rho=0.3, tau=0.5, alpha2=0.024, alternative = "one.sided")
TwoArms.CondPower(mu1=0.32, sigma1=2, mu2=0.4, sigma2=1.8, n1=340, n2=340,
rho=0.3, tau=0.5, alpha2=0.024, alternative = "one.sided")



