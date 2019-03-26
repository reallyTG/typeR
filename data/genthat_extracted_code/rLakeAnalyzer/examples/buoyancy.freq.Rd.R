library(rLakeAnalyzer)


### Name: buoyancy.freq
### Title: Calculates buoyancy frequency.
### Aliases: buoyancy.freq
### Keywords: arith

### ** Examples



	# A vector of water temperatures
	wtr = c(22.51, 22.42, 22.4, 22.4, 22.4, 22.36, 22.3, 22.21, 22.11, 21.23, 16.42, 
		15.15, 14.24, 13.35, 10.94, 10.43, 10.36, 9.94, 9.45, 9.1, 8.91, 8.58, 8.43)

	#A vector defining the depths
	depths = c(0, 0.5, 1, 1.5, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 
		17, 18, 19, 20)
	
	b.f = buoyancy.freq(wtr, depths)
	
	plot(b.f, attr(b.f, 'depths'), type='b', 
		ylab='Depth', xlab='Buoyancy Frequency', ylim=c(max(depths), min(depths)))




