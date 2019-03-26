library(gsw)


### Name: gsw_SP_from_SA
### Title: Convert from Absolute Salinity to Practical Salinity
### Aliases: gsw_SP_from_SA

### ** Examples

SA <-   c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <-    c(     10,      50,     125,     250,     600,    1000)
lat <-  c(      4,       4,       4,       4,       4,       4)
long <- c(    188,     188,     188,     188,     188,     188)
SP <- gsw_SP_from_SA(SA,p,long,lat)
expect_equal(SP, c(34.548721553448317, 34.727477488096639, 34.860554877708005,
                   34.680971112271791, 34.567971663653388, 34.560036751118204))



