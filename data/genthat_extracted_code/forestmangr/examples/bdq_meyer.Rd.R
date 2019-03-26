library(forestmangr)


### Name: bdq_meyer
### Title: Classify a forest for selective cutting using the Meyer BDq
###   method
### Aliases: bdq_meyer

### ** Examples

library(forestmangr)
data("exfm20")
exfm20

# To get the table with the regulated forest:
bdq_meyer(exfm20, "transect", "dbh", 1000)

# Use different class interval values to get different results:
bdq_meyer(exfm20, "transect", "dbh", 1000, class_interval = 10)

# It's possible to get different outputs:
bdq_meyer(exfm20, "transect", "dbh", 1000, output="model")
bdq_meyer(exfm20, "transect", "dbh", 1000, output="coefs")
bdq_meyer(exfm20, "transect", "dbh", 1000, output="full")





