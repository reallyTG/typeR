library(rptR)


### Name: rptGaussian
### Title: LMM-based Repeatability Estimation for Gaussian Data
### Aliases: rptGaussian

### ** Examples

 

data(BeetlesBody)

# Note: nboot and npermut are set to 3 for speed reasons. Use larger numbers
# for the real analysis.

# one random effect
rpt_est <- rptGaussian(BodyL ~ (1|Population), grname="Population", 
                   data=BeetlesBody, nboot=3, npermut=3, ratio = FALSE)

# two random effects
rptGaussian(BodyL ~ (1|Container) + (1|Population), grname=c("Container", "Population"), 
                   data=BeetlesBody, nboot=3, npermut=3)
                   
# unadjusted repeatabilities with fixed effects and 
# estimation of the fixed effect variance
rptGaussian(BodyL ~ Sex + Treatment + Habitat + (1|Container) + (1|Population), 
                  grname=c("Container", "Population", "Fixed"), 
                  data=BeetlesBody, nboot=3, npermut=3, adjusted=FALSE)
                  
                  
# two random effects, estimation of variance (instead repeatability)
R_est <- rptGaussian(formula = BodyL ~ (1|Population) + (1|Container), 
            grname= c("Population", "Container", "Residual"),
            data=BeetlesBody, nboot=3, npermut=3, ratio = FALSE)




