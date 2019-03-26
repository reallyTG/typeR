library(R2MLwiN)


### Name: tutorial
### Title: Exam results for six inner London Education Authorities
### Aliases: tutorial
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(tutorial, package = "R2MLwiN")
##D 
##D # Fit 2-level variance components model, using IGLS (default estimation method)
##D (VarCompModel <- runMLwiN(normexam ~ 1 + (1 | school) + (1 | student), data = tutorial))
##D 
##D # print variance partition coefficient (VPC)
##D print(VPC <- coef(VarCompModel)[["RP2_var_Intercept"]] /
##D              (coef(VarCompModel)[["RP1_var_Intercept"]] +
##D              coef(VarCompModel)[["RP2_var_Intercept"]]))
##D 
##D # Fit same model using MCMC
##D (VarCompMCMC <- runMLwiN(normexam ~ 1 + (1 | school) + (1 | student),
##D  estoptions = list(EstM = 1), data = tutorial))
##D 
##D # return diagnostics for VPC
##D VPC_MCMC <- VarCompMCMC@chains[,"RP2_var_Intercept"] /
##D             (VarCompMCMC@chains[,"RP1_var_Intercept"] +
##D             VarCompMCMC@chains[,"RP2_var_Intercept"])
##D sixway(VPC_MCMC, name = "VPC")
##D 
##D # Adding predictor, allowing its coefficient to vary across groups (i.e. random slopes)
##D (standlrtRS_MCMC <- runMLwiN(normexam ~ 1 + standlrt + (1 + standlrt | school) + (1 | student),
##D  estoptions = list(EstM = 1), data = tutorial))
##D 
##D # Example modelling complex level 1 variance
##D # fit log of precision at level 1 as a function of predictors
##D (standlrtC1V_MCMC <- runMLwiN(normexam ~ 
##D   1 + standlrt + (school | 1 + standlrt) + (1 + standlrt | student),
##D   estoptions = list(EstM = 1, mcmcMeth = list(lclo = 1)),
##D   data = tutorial))
##D 
## End(Not run)



