library(gsw)


### Name: gsw_SA_from_SP
### Title: Convert from Practical Salinity to Absolute Salinity
### Aliases: gsw_SA_from_SP

### ** Examples

SP <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
p <- c(      10,      50,     125,     250,     600,    1000)
lat <- c(     4,       4,       4,       4,       4,       4)
long <- c(  188,     188,     188,     188,     188,     188)
SA <- gsw_SA_from_SP(SP, p, long, lat)
expect_equal(SA, c(34.711778344814114, 34.891522618230098, 35.025544862476920,
                   34.847229026189588, 34.736628474576051, 34.732363065590846))



