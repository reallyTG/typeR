library(sValues)


### Name: sValues
### Title: S-values: conventional model ambiguity measures
### Aliases: sValues sValues sValues.formula sValues sValues.matrix sValues
###   sValues.data.frame

### ** Examples

# growth regressions example
## All variables, No favorites
data(economic_growth)
eg_sv <- sValues(GR6096 ~ ., data = economic_growth)
eg_sv # prints results
plot(eg_sv, R2_bounds = c(0.5, 1))
plot(eg_sv, type = "beta_plot", variable = "P60", error_bar = TRUE)
coefs_eg <- coef(eg_sv) # extract coefficients
coefs_eg

##  only 14 variables
eg_sv_14 <-  sValues(GR6096 ~GDPCH60L + OTHFRAC + ABSLATIT + 
                       LT100CR + BRIT + GOVNOM1 + WARTIME + 
                       SCOUT + P60 + PRIEXP70 + OIL + 
                       H60 + POP1560 + POP6560, data = economic_growth)
eg_sv_14
coefs_eg_14 <- coef(eg_sv_14)

## With 14 favorites among all variables
favorites <- c("GDPCH60L", "OTHFRAC", "ABSLATIT", "LT100CR", 
              "BRIT", "GOVNOM1", "WARTIME", "SCOUT", 
              "P60", "PRIEXP70", "OIL", "H60", 
              "POP1560", "POP6560")
eg_sv_fav <- sValues(GR6096 ~ ., data = economic_growth, R2_bounds = c(0.5, 1),
                    favorites = favorites, R2_favorites = c(0.4, 0.8))
eg_sv_fav
plot(eg_sv_fav, R2_bounds = c(0.5, 1))
plot(eg_sv_fav, type = "beta_plot", variable = "P60", error_bar = TRUE)
coefs_eg_fav <- coef(eg_sv_fav)
coefs_eg_fav




