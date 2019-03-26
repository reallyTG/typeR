library(CopulaCenR)


### Name: fitted.CopulaCenR
### Title: Fitted values from CopulaCenR regression models
### Aliases: fitted.CopulaCenR

### ** Examples

data(AREDS)
# fit a Copula2-Sieve model
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
output <- fitted(object = copula2_sp)



