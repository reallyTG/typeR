library(CopulaCenR)


### Name: ic_spTran_copula
### Title: Copula regression models with semiparametric margins for
###   bivariate interval-censored data
### Aliases: ic_spTran_copula

### ** Examples

# fit a Copula2-Semiparametric model
data(AREDS)
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
summary(copula2_sp)



