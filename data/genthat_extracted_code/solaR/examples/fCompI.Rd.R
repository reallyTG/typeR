library(solaR)


### Name: C_fCompI
### Title: Calculation of solar irradiance on a horizontal surface
### Aliases: fCompI
### Keywords: utilities

### ** Examples


lat <- 37.2

BTd <- fBTd(mode='serie')
solD <- fSolD(lat, BTd[100])
solI <- fSolI(solD, sample='hour')
G0d <- zoo(5000, index(solD))
compD <- fCompD(solD, G0d, corr = "Page")
fCompI(solI, compD)

sol <- calcSol(lat, fBTd(mode='prom'), sample='hour', keep.night=FALSE)

G0dm <- c(2.766, 3.491, 4.494, 5.912, 6.989, 7.742,
          7.919, 7.027, 5.369, 3.562, 2.814, 2.179)*1000

Ta <- c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9,
        24.3, 18.2, 17.2, 15.2)

BD <- readG0dm(G0dm = G0dm, Ta = Ta, lat = lat)
compD <- fCompD(sol, BD, corr = 'Page')
compI <- fCompI(sol, compD)
head(compI)

## Use of 'corr'.  The help page of calcG0 includes additional examples
## with intradaily data xyplot(fd ~ kt, data=compI)

climed <- fCompI(sol, G0I=compI, corr = 'CLIMEDh')
xyplot(fd ~ kt, data=climed)

ekdh <- fCompI(sol, G0I=compI, corr = 'EKDh')
xyplot(fd ~ kt, data=ekdh)

brl <- fCompI(sol, G0I=compI, corr = 'BRL')
xyplot(fd ~ kt, data=brl)



