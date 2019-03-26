library(CopulaCenR)


### Name: rc_spCox_copula
### Title: Copula regression models with Cox semiparametric margins for
###   bivariate right-censored data
### Aliases: rc_spCox_copula

### ** Examples

# fit a Clayton-Cox model
data(DRS)
clayton_cox <- rc_spCox_copula(data = DRS, var_list = "treat",
                            copula = "Clayton", B = 2)
summary(clayton_cox)



