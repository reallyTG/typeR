library(landsat)


### Name: DOS
### Title: Dark Object Subtraction
### Aliases: DOS
### Keywords: spatial

### ** Examples


	data(july1)
	data(july3)

	# One approach to choosing a Starting Haze Value is to take the lowest DN value
	# with a frequency greater than some predetermined threshold, in this case 1000 pixels. 
	SHV <- table(july1@data[,1])
	SHV <- min(as.numeric(names(SHV)[SHV > 1000]))
	# this is used as Lhaze in the radiocorr function

	# G_rescale, B_rescale, sun elevation comes from metadata for the SHV band
	july.DOS <- DOS(sat=7, SHV=SHV, SHV.band=1, Grescale=0.77569, Brescale=-6.20000, sunelev=61.4, edist=ESdist("2002-07-20"))$DNfinal.mean

	# DOS() returns results for the complete set of scattering coefficients
	# need to choose the appropriate one based on general atmospheric conditions
		###	-4.0: Very Clear	SHV <= 55
		###	-2.0: Clear		SHV 56-75
		### 	-1.0: Moderate		SHV 76-95
		###	-0.7: Hazy		SHV 96-115
		###	-0.5: Very Hazy		SHV >115
	# for july, SHV == 70, so use -2.0: Clear
	july.DOS <- july.DOS[ , 2]

	# Use DOS value as Lhaze in radiocorr() for DOS correction to reflectance
	july3.DOSrefl <- radiocorr(july3, Grescale=0.77569, Brescale=-6.20000, sunelev=61.4, edist=ESdist("2002-07-20"), Esun=1533, Lhaze=july.DOS[3], method="DOS")




