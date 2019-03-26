library(FENmlm)


### Name: print.femlm
### Title: A print facility for 'femlm' objects. It can compute different
###   types of standard errors.
### Aliases: print.femlm

### ** Examples


# Load trade data
data(trade)

# We estimate the effect of distance on trade => we account for 3 cluster effects
est_pois = femlm(Euros ~ log(dist_km)|Origin+Destination+Product, trade)

# displaying the results
print(est_pois)

# with other type of standard error:
print(est_pois, se = "c")





