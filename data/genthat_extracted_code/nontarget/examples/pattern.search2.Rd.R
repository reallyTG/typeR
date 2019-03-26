library(nontarget)


### Name: pattern.search2
### Title: Detecting and grouping isotope m/z relations among LC-HRMS
###   centroid peaks, based on quantized reference data
### Aliases: pattern.search2

### ** Examples

## No test: 
######################################################
# load HRMS centroid list: ###########################
data(peaklist)
# load isotope data ##################################
data(isotopes)
# load quantized simulation data #####################
data(OrbitrapXL_VelosPro_R60000at400_q)
######################################################
# run isotope pattern grouping #######################
# save the list returned as "pattern" ################
pattern<-pattern.search2(
	peaklist,
	OrbitrapXL_VelosPro_R60000at400_q,
	mztol=2, 
	ppm=TRUE,
	inttol=0.5,
	rttol=0.3,
	use_isotopes=FALSE,
	use_charges=FALSE,
	use_marker=TRUE,
	quick=FALSE,
	isotopes
)
names(pattern);
######################################################
## End(No test)



