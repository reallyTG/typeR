library(CopulaCenR)


### Name: rc_par_copula
### Title: Copula regression models with parametric margins for bivariate
###   right-censored data
### Aliases: rc_par_copula

### ** Examples

# fit a Clayton-Weibull model
data(DRS)
clayton_wb <- rc_par_copula(data = DRS, var_list = "treat",
                            copula = "Clayton",
                            m.dist = "Weibull")
summary(clayton_wb)



