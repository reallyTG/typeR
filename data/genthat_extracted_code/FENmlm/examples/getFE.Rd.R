library(FENmlm)


### Name: getFE
### Title: Extract the Fixed-Effects from a 'femlm' estimation.
### Aliases: getFE

### ** Examples


data(trade)

# We estimate the effect of distance on trade => we account for 3 cluster effects
est_pois = femlm(Euros ~ log(dist_km)|Origin+Destination+Product, trade)

# obtaining the cluster coefficients
fe_trade = getFE(est_pois)

# plotting them
plot(fe_trade)

# plotting only the Products fixed-effects & showing more of them
plot(fe_trade$Product, n=8)




