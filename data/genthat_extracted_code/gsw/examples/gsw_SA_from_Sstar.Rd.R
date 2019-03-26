library(gsw)


### Name: gsw_SA_from_Sstar
### Title: Absolute Salinity from Preformed Salinity
### Aliases: gsw_SA_from_Sstar

### ** Examples

SP <- c(34.7115, 34.8912, 35.0247, 34.8436, 34.7291, 34.7197)
p <- c(      10,      50,     125,     250,     600,    1000)
lat <- c(     4,       4,       4,       4,       4,       4)
long <- c(  188,     188,     188,     188,     188,     188)
SA <- gsw_SA_from_Sstar(SP, p, long, lat)
expect_equal(SA, c(34.711724663585905, 34.891561223296009, 35.025594598699882,
                   34.847235885385913, 34.736694493054166, 34.732387111902753))



