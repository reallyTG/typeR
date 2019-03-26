library(epiphy)


### Name: sadie
### Title: Spatial Analysis by Distance IndicEs (SADIE).
### Aliases: sadie sadie.data.frame sadie.matrix sadie.count
###   sadie.incidence

### ** Examples

set.seed(123)
# Create an intensity object:
my_count <- count(aphids, mapping(x = xm, y = ym))
# Only compute Perry's indices:
my_res <- sadie(my_count)
my_res
summary(my_res)
plot(my_res)
plot(my_res, isoclines = TRUE)

set.seed(123)
# Compute both Perry's and Li-Madden-Xu's indices (using multithreading):
my_res <- sadie(my_count, index = "all", threads = 2, nperm = 20)
my_res
summary(my_res)
plot(my_res) # Identical to: plot(my_res, index = "Perry")
plot(my_res, index = "Li-Madden-Xu")

set.seed(123)
# Using usual data frames instead of intensity objects:
my_df <- aphids[, c("xm", "ym", "i")]
sadie(my_df)




