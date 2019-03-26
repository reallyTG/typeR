library(gsw)


### Name: gsw_SA_from_SP_Baltic
### Title: Convert from Practical Salinity to Absolute Salinity (Baltic)
### Aliases: gsw_SA_from_SP_Baltic

### ** Examples

SP <- c( 6.5683, 6.6719, 6.8108, 7.2629, 7.4825, 10.2796)
lon <- c(    20,     20,     20,     20,     20,      20)
lat <- c(    59,     59,     59,     59,     59,      59)
SA <- gsw_SA_from_SP_Baltic(SP, lon, lat)
expect_equal(SA, c(6.669945432342856, 6.773776430742856, 6.912986138057142,
                 7.366094191885713, 7.586183837142856, 10.389520570971428))



