library(ADCT)


### Name: CopriEndpt.Power
### Title: Power Calculation for Two Coprimary Endpoints.
### Aliases: CopriEndpt.Power

### ** Examples

# Example in Chang (2014) page  272
CopriEndpt.Power(n=197, tau=0.5, mu1=0.2, mu2=0.2, rho=0.5,
alpha1=0.0025, alpha2=0.024, alternative="one.sided")
 sapply(c(-0.8,-0.5,-0.2,0,0.2,0.5,0.8),CopriEndpt.Power,
n=197, tau=0.5, mu1=0.2, mu2=0.2, alpha1=0.0025, alpha2=0.024, alternative="one.sided")



