library(soilDB)


### Name: fetchOSD
### Title: Fetch Data by Soil Series Name
### Aliases: fetchOSD
### Keywords: manip

### ** Examples

## Not run: 
##D # soils of interest
##D s.list <- c('musick', 'cecil', 'drummer', 'amador', 'pentz', 
##D 'reiff', 'san joaquin', 'montpellier', 'grangeville', 'pollasky', 'ramona')
##D 
##D # fetch and convert data into an SPC
##D s.moist <- fetchOSD(s.list, colorState='moist')
##D s.dry <- fetchOSD(s.list, colorState='dry')
##D 
##D # plot profiles
##D # moist soil colors
##D par(mar=c(0,0,0,0), mfrow=c(2,1))
##D plot(s.moist, name='hzname', cex.names=0.85, axis.line.offset=-4)
##D plot(s.dry, name='hzname', cex.names=0.85, axis.line.offset=-4)
##D 
##D # extended mode: return a list with SPC + summary tables
##D x <- fetchOSD(s.list, extended = TRUE, colorState = 'dry')
##D 
##D par(mar=c(0,0,1,1))
##D plot(x$SPC)
##D 
##D str(x, 1)
##D 
## End(Not run)



