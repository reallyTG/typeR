library(tsDyn)


### Name: lags.select
### Title: Selection of the lag with Information criterion.
### Aliases: lags.select
### Keywords: ts

### ** Examples



data(barry)

# 
rk_sel <- lags.select(barry)
rk_sel
summary(rk_sel)





