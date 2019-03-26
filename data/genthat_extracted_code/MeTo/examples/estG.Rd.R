library(MeTo)


### Name: estG
### Title: Estimate soil heat flux (G)
### Aliases: estG

### ** Examples

estG(x = as.POSIXct(c('2018-10-01 14:30', '2018-10-01 15:00')), Tmean = 38, Rhmean = 52, Rs = 2.450,
     elev = 8, lat.deg = 16.21, long.deg = 343.75, control = list(Lz = 15))

estG(x = as.POSIXct('2018-10-01 02:30'), Tmean = 28, Rhmean = 90, tl = 1, Rs = 0, elev = 8,
     lat.deg = 16.2, long.deg = 343.75, control = list(Lz = 15, est.ratio.Rs.Rso = 0.8))

estG(x = as.POSIXct('2018-10-01 14:30'), Tmean = 38, Rhmean = 52, tl = 1, Rs = 2.450, elev = 8,
     lat.deg = 16.21, long.deg = 343.75, control = list(Lz = 15))




