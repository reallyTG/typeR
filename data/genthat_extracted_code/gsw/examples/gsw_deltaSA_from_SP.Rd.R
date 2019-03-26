library(gsw)


### Name: gsw_deltaSA_from_SP
### Title: Absolute Salinity Anomaly from Practical Salinity
### Aliases: gsw_deltaSA_from_SP

### ** Examples

SP =   c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p =    c(     10,      50,     125,     250,     600,    1000)
lat =  c(      4,       4,       4,       4,       4,       4)
long = c(    188,     188,     188,     188,     188,     188)
deltaSA = gsw_deltaSA_from_SP(SP,p,long,lat)
expect_equal(deltaSA, c(0.000167203365230, 0.000268836122231, 0.000665803155705,
                        0.002706154619403, 0.005652977406832,  0.009444734661606))



