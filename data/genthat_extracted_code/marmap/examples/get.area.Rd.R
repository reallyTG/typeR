library(marmap)


### Name: get.area
### Title: Get projected surface area
### Aliases: get.area

### ** Examples


## get area for the entire hawaii dataset:
	data(hawaii)
	plot(hawaii, lwd=0.2)
	
	mesopelagic <- get.area(hawaii, level.inf=-1000, level.sup=-200)
	bathyal <- get.area(hawaii, level.inf=-4000, level.sup=-1000)
	abyssal <- get.area(hawaii, level.inf=min(hawaii), level.sup=-4000)
	
	col.meso <- rgb(0.3, 0, 0.7, 0.3) 
	col.bath <- rgb(0.7, 0, 0, 0.3) 
	col.abys <- rgb(0.7, 0.7, 0.3, 0.3) 

	plotArea(mesopelagic, col = col.meso)
	plotArea(bathyal, col = col.bath)
	plotArea(abyssal, col = col.abys)
	
	me <- round(mesopelagic$Square.Km, 0)
	ba <- round(bathyal$Square.Km, 0)
	ab <- round(abyssal$Square.Km, 0)

	legend(x="bottomleft",
		legend=c(paste("mesopelagic:",me,"km2"),
		         paste("bathyal:",ba,"km2"), 
		         paste("abyssal:",ab,"km2")), 
		col="black", pch=21, 
		pt.bg=c(col.meso,col.bath,col.abys))

# Use of xlim and ylim
	data(hawaii)
	plot(hawaii, lwd=0.2)
	
	mesopelagic <- get.area(hawaii, xlim=c(-161.4,-159), ylim=c(21,23),
	                        level.inf=-1000, level.sup=-200)
	bathyal <- get.area(hawaii, xlim=c(-161.4,-159), ylim=c(21,23),
	                        level.inf=-4000, level.sup=-1000)
	abyssal <- get.area(hawaii, xlim=c(-161.4,-159), ylim=c(21,23),
	                        level.inf=min(hawaii), level.sup=-4000)
	
	col.meso <- rgb(0.3, 0, 0.7, 0.3) 
	col.bath <- rgb(0.7, 0, 0, 0.3) 
	col.abys <- rgb(0.7, 0.7, 0.3, 0.3) 
	
	plotArea(mesopelagic, col = col.meso)
	plotArea(bathyal, col = col.bath)
	plotArea(abyssal, col = col.abys)
	
	me <- round(mesopelagic$Square.Km, 0)
	ba <- round(bathyal$Square.Km, 0)
	ab <- round(abyssal$Square.Km, 0)
	
	legend(x="bottomleft",
		legend=c(paste("mesopelagic:",me,"km2"),
		         paste("bathyal:",ba,"km2"), 
		         paste("abyssal:",ab,"km2")), 
		col="black", pch=21, 
		pt.bg=c(col.meso,col.bath,col.abys))



