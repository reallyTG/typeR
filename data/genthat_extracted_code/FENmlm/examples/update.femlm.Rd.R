library(FENmlm)


### Name: update.femlm
### Title: Updates a femlm estimation
### Aliases: update.femlm

### ** Examples


# Example using trade data
data(trade)

# main estimation
est_pois <- femlm(Euros ~ log(dist_km) | Origin + Destination, trade)

# we add the variable log(Year)
est_2 <- update(est_pois, . ~ . + log(Year))

# we add another cluster: "Product"
est_3 <- update(est_2, . ~ . | . + Product)

# we remove the cluster "Origin" and the variable log(dist_km)
est_4 <- update(est_3, . ~ . - log(dist_km) | . - Origin)

# Quick look at the 4 estimations
res2table(est_pois, est_2, est_3, est_4)




