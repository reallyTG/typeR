library(gsw)


### Name: gsw_Fdelta
### Title: Ratio of Absolute to Preformed Salinity, minus 1
### Aliases: gsw_Fdelta

### ** Examples

p <- c(         10,   50,  125,  250,  600, 1000)
latitude <- c(   4,    4,    4,    4,    4,    4)
longitude <- c(188,  188,  188,  188,  188,  188)
r <- gsw_Fdelta(p, longitude, latitude)
expect_equal(r/1e-3, c(0.006472309923452, 0.010352848168433, 0.025541937543450,
                     0.104348729347986, 0.218678084205081, 0.365415366571266))



