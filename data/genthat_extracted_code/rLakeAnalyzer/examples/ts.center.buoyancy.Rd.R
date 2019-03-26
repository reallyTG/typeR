library(rLakeAnalyzer)


### Name: ts.center.buoyancy
### Title: Calculates the center of buoyancy for multiple temperature
###   profiles.
### Aliases: ts.center.buoyancy
### Keywords: arith

### ** Examples



  #Get the path for the package example file included
  wtr.path <- system.file('extdata', 'Sparkling.daily.wtr', package="rLakeAnalyzer")
	
  #Load data for example lake, Sparkilng Lake, Wisconsin.
  sp.wtr = load.ts(wtr.path)
	 
  #calculate and plot the thermocline depth
  t.d = ts.thermo.depth(sp.wtr)
  
  center.N2 = ts.center.buoyancy(sp.wtr)
	
  plot(center.N2, type='l', ylab='Depth (m)', xlab='Date', ylim=c(19,0), lwd = 1.5)
  lines(t.d, type='l', col='red', lwd = 1.5)
  legend(x = t.d[3,1], y = .25,
     c('center of buoyancy','thermocline depth'),
     lty=c(1,1),
     lwd=c(1.5,1.5),col=c("black","red"), bty = "n")
	



