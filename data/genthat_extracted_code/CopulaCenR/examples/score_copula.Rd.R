library(CopulaCenR)


### Name: score_copula
### Title: Generalized score test for covariate effect(s)
### Aliases: score_copula

### ** Examples

# Score test for "rs2284665" in AREDS data
# fit a Copula2-semiparametric model under NULL
data(AREDS)
copula2_sp_null <- ic_spTran_copula(data = AREDS, copula = "Copula2",
                   l = 0, u = 15, m = 3, r = 3,
                   var_list = c("ENROLLAGE","SevScaleBL"))
score_copula(object = copula2_sp_null, var_score = "rs2284665")



