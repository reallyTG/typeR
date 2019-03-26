library(rptR)


### Name: rptPoisson
### Title: GLMM-based Repeatability Estimation for Poisson-distributed Data
### Aliases: rptPoisson

### ** Examples

# load data
data(BeetlesFemale)

# Note: nboot and npermut are set to 0 for speed reasons. 

# estimating adjusted repeatabilities for two random effects
rptPoisson(Egg ~ Treatment + (1|Container) + (1|Population), 
                   grname=c("Container", "Population"), 
                   data = BeetlesFemale, nboot=0, npermut=0)

# unadjusted repeatabilities with  fixed effects and 
# estimation of the fixed effect variance
rptPoisson(Egg ~ Treatment + (1|Container) + (1|Population), 
                   grname=c("Container", "Population", "Fixed"), 
                   data=BeetlesFemale, nboot=0, npermut=0, adjusted=FALSE)
                
               
# variance estimation of random effects, residual and overdispersion 
rptPoisson(formula = Egg ~ Treatment + (1|Container) + (1|Population) , 
                   grname=c("Container","Population","Residual", "Overdispersion"), 
                   data = BeetlesFemale, nboot=0, npermut=0, ratio = FALSE)
                   
                   





