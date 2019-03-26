library(nontarget)


### Name: pattern.search
### Title: Detecting and grouping isotope m/z relations among peaks in a
###   HRMS dataset
### Aliases: pattern.search

### ** Examples

## No test: 
######################################################
# load required data: ################################
# HRMS peak list: ####################################
data(peaklist)
peaklist<-rm.sat(peaklist,dmz=0.3,drt=0.1,intrat=0.015,spar=0.8,corcut=-1000,plotit=TRUE);
peaklist<-peaklist[peaklist[,4],1:3];
# list of isotopes ###################################
data(isotopes)
######################################################
# (1) run isotope pattern grouping ###################
# (1.1) define isotopes and charge (z) argument ######
iso<-make.isos(isotopes,
	use_isotopes=c("13C","15N","34S","37Cl","81Br","41K","13C","15N","34S","37Cl","81Br","41K"),
	use_charges=c(1,1,1,1,1,1,2,2,2,2,2,2))
# (1.2) run isotope grouping #########################
# save the list returned as "pattern" ################
pattern<-pattern.search(
  peaklist,
  iso,
  cutint=10000,
  rttol=c(-0.05,0.05),
  mztol=2,
  mzfrac=0.1,
  ppm=TRUE,
  inttol=0.2,
  rules=c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE),
  deter=FALSE,
  entry=50
);
names(pattern);
# extract peaks listed in isotope pattern group no.1 #
# under pattern[[3]] from pattern[[1]] ###############
pattern[[1]][as.numeric(strsplit(as.character(pattern[[3]][1,2]),",")[[1]]),];
# (1.3) plot results #################################
plotisotopes(pattern);
plotdefect(pattern,elements=c("N"));
######################################################
## End(No test)



