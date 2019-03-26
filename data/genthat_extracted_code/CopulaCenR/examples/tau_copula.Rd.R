library(CopulaCenR)


### Name: tau_copula
### Title: Calculate Kendall's tau
### Aliases: tau_copula

### ** Examples

# fit a Copula2-Semiparametric model
data(AREDS)
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
tau_copula(eta = as.numeric(coef(copula2_sp)[c("alpha","kappa")]),
           copula = "Copula2")




