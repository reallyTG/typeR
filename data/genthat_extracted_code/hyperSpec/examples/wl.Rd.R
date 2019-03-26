library(hyperSpec)


### Name: wl
### Title: Getting and Setting the Wavelength Axis 'wl' returns the
###   wavelength axis, 'wl<-' sets it.
### Aliases: wl wl<-

### ** Examples


	wl (laser)

	# convert from wavelength to frequency
	plot (laser)
	wl (laser, "f / Hz") <- 2.998e8 * wl (laser) * 1e9
	plot (laser)

	# convert from Raman shift to wavelength
	# excitation was at 785 nm
	plot (chondro [1])
	wl (chondro) <- list (wl = 1e7 / (1e7/785 - wl (chondro)), label = expression (lambda / nm))
	plot (chondro [1])




