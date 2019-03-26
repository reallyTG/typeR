library(CopulaCenR)


### Name: lrt_copula
### Title: Likelihood-ratio test for covariate effect(s) in copula models
### Aliases: lrt_copula

### ** Examples

#' # Likelihood-ratio test for "rs2284665" in AREDS data
data(AREDS)
# Fit null model without "rs2284665"
copula2_sp_null <- ic_spTran_copula(data = AREDS, copula = "Copula2",
                   l = 0, u = 15, m = 3, r = 3,
                   var_list = c("SevScaleBL"))
# Fit full model
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("rs2284665","SevScaleBL"))
lrt_copula(model1 = copula2_sp, model2 = copula2_sp_null)



