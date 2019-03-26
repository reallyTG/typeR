library(FENmlm)


### Name: print.femlm.allClusters
### Title: Print method for cluster coefficients
### Aliases: print.femlm.allClusters

### ** Examples


data(trade)

# We estimate the effect of distance on trade
# => we account for 3 cluster effects
est_pois = femlm(Euros ~ log(dist_km)|Origin+Destination+Product, trade)

# obtaining the cluster coefficients
fe_trade = getFE(est_pois)

# printing some summary information on the cluster coefficients:
fe_trade





