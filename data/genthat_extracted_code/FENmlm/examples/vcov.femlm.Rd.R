library(FENmlm)


### Name: vcov.femlm
### Title: Extract the variance/covariance of a femlm fit
### Aliases: vcov.femlm

### ** Examples


# Load trade data
data(trade)

# We estimate the effect of distance on trade (with 3 fixed-effects)
est_pois = femlm(Euros ~ log(dist_km) + log(Year) | Origin + Destination +
                 Product, trade)

# "normal" VCOV
vcov(est_pois)

# "white" VCOV
vcov(est_pois, se = "white")

# "clustered" VCOV (with respect to the Origin factor)
vcov(est_pois, se = "cluster")

# "clustered" VCOV (with respect to the Product factor)
vcov(est_pois, se = "cluster", cluster = trade$Product)
# another way to make the same request:
vcov(est_pois, se = "cluster", cluster = "Product")

# Another estimation without cluster:
est_pois_simple = femlm(Euros ~ log(dist_km) + log(Year), trade)

# We can still get the clustered VCOV,
# but we need to give the cluster-vector:
vcov(est_pois_simple, se = "cluster", cluster = trade$Product)





