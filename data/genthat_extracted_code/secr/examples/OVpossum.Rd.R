library(secr)


### Name: OVpossum
### Title: Orongorongo Valley Brushtail Possums
### Aliases: OVpossum OVpossumCH
### Keywords: datasets

### ** Examples


summary(OVpossumCH, terse = TRUE)
ovtrap <- traps(OVpossumCH[[1]])

## retrieve and plot the forest map
datadir <- system.file("extdata", package = "secr")
OVforest <- rgdal::readOGR(dsn = datadir, layer = "OVforest")

forestcol <- terrain.colors(6)[c(4,2,2)]
sp::plot(OVforest, col = forestcol)
plot(ovtrap, add = TRUE)

## construct a mask
## we omit forest across the river by selecting only
## forest polygons 1 and 2 
ovmask <- make.mask(ovtrap, buffer = 120, type = 'trapbuffer',
    poly = OVforest[1:2,], spacing = 7.5, keep.poly = FALSE)
ovmask <- addCovariates(ovmask, OVforest[1:2,])

## display mask
par(mar=c(0,0,0,8))
plot(ovmask, covariate = 'forest', dots = FALSE, col = forestcol)
plot(ovtrap, add = TRUE)

## add the left bank of the Orongorongo River
lines(read.table(paste0(datadir,'/leftbank.txt')))




