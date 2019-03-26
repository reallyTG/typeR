library(CopulaCenR)


### Name: CopulaCenR
### Title: Copula-based regression models for bivariate censored data
### Aliases: CopulaCenR

### ** Examples

### bivariate right-censored data
data(DRS)
# fit a Clayton-Weibull model
clayton_wb <- rc_par_copula(data = DRS,
                            var_list = "treat",
                            copula = "Clayton",
                            m.dist = "Weibull")
summary(clayton_wb)

### bivariate interval-censored data
data(AREDS)
copula2_sp <- ic_spTran_copula(data = AREDS,
              copula = "Copula2", l = 0, u = 15,
              m = 3, r = 3, var_list =
              c("ENROLLAGE", "rs2284665",
              "SevScaleBL"))
summary(copula2_sp)



