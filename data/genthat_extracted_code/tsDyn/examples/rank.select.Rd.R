library(tsDyn)


### Name: rank.select
### Title: Selection of the cointegrating rank with Information criterion.
### Aliases: rank.select summary.rank.select print.rank.select
###   summary.rank.select
### Keywords: VECM cointegration ts

### ** Examples



data(barry)

# 
rk_sel <- rank.select(barry)
rk_sel
summary(rk_sel)





