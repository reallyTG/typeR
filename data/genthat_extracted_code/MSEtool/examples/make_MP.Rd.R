library(MSEtool)


### Name: make_MP
### Title: Make a custom management procedure (MP)
### Aliases: make_MP

### ** Examples

# A delay-difference model with a 40-10 control rule
DD_40_10 <- make_MP(DD_TMB, HCR40_10)

# A delay difference model that will produce convergence diagnostics
DD_40_10 <- make_MP(DD_TMB, HCR40_10, diagnostic = "min")

# MP that uses a Delay-Difference which assumes a Ricker stock-recruit function.
DD_Ricker <- make_MP(DD_TMB, HCR_MSY, SR = "Ricker")

## Not run: 
##D myMSE <- DLMtool::runMSE(DLMtool::testOM, MPs = c("FMSYref", "DD_40_10"))
##D 
##D ls(DLMenv) # Model output during MSE is assigned to this environment.
##D diagnostic_AM(myMSE)
## End(Not run)




