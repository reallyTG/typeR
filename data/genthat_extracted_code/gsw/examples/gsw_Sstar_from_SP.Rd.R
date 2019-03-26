library(gsw)


### Name: gsw_Sstar_from_SP
### Title: Convert from Practical Salinity to Preformed Salinity
### Aliases: gsw_Sstar_from_SP

### ** Examples

SP <-   c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
p <-    c(     10,      50,     125,     250,     600,    1000)
lat <-  c(      4,       4,       4,       4,       4,       4)
long <- c(    188,     188,     188,     188,     188,     188)
Sstar <- gsw_Sstar_from_SP(SP,p,long,lat)
expect_equal(Sstar, c(34.711553680880769, 34.891161395333754, 35.024650265047370,
                      34.843593141519356, 34.729033995955525, 34.719675962471783))



