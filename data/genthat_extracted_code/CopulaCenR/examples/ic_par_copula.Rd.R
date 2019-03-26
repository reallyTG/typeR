library(CopulaCenR)


### Name: ic_par_copula
### Title: Copula regression models with parametric margins for bivariate
###   interval-censored data
### Aliases: ic_par_copula

### ** Examples

# fit a Copula2-Weibull model
data(AREDS)
copula2_wb <- ic_par_copula(data = AREDS, copula = "Copula2",
                  m.dist = "Weibull",
                  var_list = c("ENROLLAGE","rs2284665"))
summary(copula2_wb)



