library(osd)


### Name: ref.spects
### Title: Five MS reference spectra from the MassBank MS library for
###   spectra comparison
### Aliases: ref.spects

### ** Examples

	
	#load GC-MS sample data, containing three different metabolites
	# appearing in co-elution.
	data(gcms1)
	data(ref.spects)

	#resolve the situation using ICA-OSD algorithm
	resolution <- osd(D=gcms1, k=3, res.method="ica.osd")

	#plot each resolved spectra for compound 1 to 3.
	ref.sp <- ref.spects$nicotinicacid1[-c(1:34)]
	plotOSDres(resolution, type="s",1,comp.spectra=ref.sp)
	
	# note that from the spectra the first 34 
	# values are omitted, this is because the original
	# spectra given comprises the masses from 1 to 600, 
	# whereas the data in gcms1 and gcms2 
	# only comprises the m/z from 35 to 600.
	



