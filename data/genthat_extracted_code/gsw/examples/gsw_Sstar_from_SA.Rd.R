library(gsw)


### Name: gsw_Sstar_from_SA
### Title: Convert from Absolute Salinity to Preformed Salinity
### Aliases: gsw_Sstar_from_SA

### ** Examples

SA <-   c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <-    c(     10,      50,     125,     250,     600,    1000)
lat <-  c(      4,       4,       4,       4,       4,       4)
long <- c(    188,     188,     188,     188,     188,     188)
Sstar <- gsw_Sstar_from_SA(SA,p,long,lat)
expect_equal(Sstar, c(34.711575335926490, 34.891138777337822, 35.024705401162166,
                      34.843564118358302, 34.729005527604883, 34.719712883389462))



