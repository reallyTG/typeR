library(flux)


### Name: gpp
### Title: Model GPP from CO2 closed chamber flux data
### Aliases: gpp gpp2
### Keywords: univar

### ** Examples

## load data
data(tt.flux)

## make timestamp
tt.flux$timestamp <- strptime(paste(tt.flux$date, tt.flux$time), 
format="%Y-%m-%d %H:%M:%S")

## model reco with Arrhenius type model
# extract data and omit estimated fluxes with both the nrmse 
# and the r2 flag set to 0
ttf <- tt.flux[!(tt.flux$CO2.r2.f + tt.flux$CO2.nrmse.f) == 0, ]

# extract table with flux data for reco modeling
ttf4reco <- subset(ttf, kind > 4)

# omit CO2 fluxes below zero
ttf4reco <- ttf4reco[ttf4reco$CO2.flux >= 0,]

# plot reco data
plot(CO2.flux ~ t.air, data=ttf4reco)

# check for the best temperature for reco modelling
temps <- c("t.air", "t.soil2", "t.soil5", "t.soil10")
sapply(temps, function(x) lapply(reco(ttf4reco$CO2.flux, 
ttf4reco[,x], method="arr"), AIC))

# take the temperature in soil 2 cm
reco.m <- reco(ttf4reco$CO2.flux, ttf4reco$t.soil2, method="arr")

# inspect
reco.m

## model gpp
# extract table with flux data for gpp modeling
ttf4gpp <- subset(ttf, kind < 4)

# do a single gpp model for a measurement day using data of spot 2
tmp <- ttf4gpp[(ttf4gpp$date=="2011-05-11") & (ttf4gpp$spot==2),]
gpp.m1 <- gpp(tmp$CO2.flux, tmp$PAR, tmp$timestamp, tmp$t.soil2, 
reco.m[[1]])
# check diagnostic plot
plot(gpp.m1)

# same for spot 3
tmp <- ttf4gpp[(ttf4gpp$date=="2011-05-11") & (ttf4gpp$spot==3),]
gpp.m2 <- gpp(tmp$CO2.flux, tmp$PAR, tmp$timestamp, tmp$t.soil2, 
reco.m[[1]])
# check diagnostic plot
plot(gpp.m2)

# same with all three spots
tmp <- ttf4gpp[(ttf4gpp$date=="2011-05-11"),]
gpp.m3 <- gpp(tmp$CO2.flux, tmp$PAR, tmp$timestamp, tmp$t.soil2, 
reco.m[[1]])
# check diagnostic plot
plot(gpp.m3)




