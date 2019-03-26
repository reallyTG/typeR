library(firebehavioR)


### Name: cfis
### Title: Canopy Fire Initiation & Spread model
### Aliases: cfis

### ** Examples

data("coForest")
# show the data format:
head(coForest)
# Predict crown fire, using coForest
# measurements and assumed weather
# parameters
df.cfis = cfis(fsg = coForest$cbh_m, u10 = 20,
    effm = 6, sfc = coForest$sfl_kgm2*10, cbd = coForest$cbd_kgm3,
    id = 1)
print(df.cfis)

# Examine differences between treatment
# statuses
aggregate(x = df.cfis$cROS, by = list(treatmentStatus = coForest$status),
    FUN = mean)
# Now, examine the sensitivity of fire
# type designations to wind speed by
# treatment status
coForest = coForest[rep(seq_len(nrow(coForest)),
    11), ]
coForest$u10 = sort(rep(10:20, 14))
coForest$type = cfis(coForest$cbh_m, coForest$u10,
    6, coForest$sfl_kgm2*10, coForest$cbd_kgm3,
    1)$type
table(u10 = coForest$u10, coForest$type,
    coForest$status)



