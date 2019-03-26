library(nontarget)


### Name: plotgroup
### Title: Barplot of m/z isotope (and optional adduct) relations within an
###   isotope pattern group.
### Aliases: plotgroup

### ** Examples

## No test: 
#############################################################
data(peaklist);
data(adducts);
data(isotopes);
# run isotope grouping ######################################
iso<-make.isos(isotopes,
	use_isotopes=c("13C","15N","34S","37Cl","81Br","41K","13C","15N","34S","37Cl","81Br","41K"),
	use_charges=c(1,1,1,1,1,1,2,2,2,2,2,2))
	
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
plotgroup(pattern,adduct=FALSE,groupID=3,massrange=10,allmass=FALSE)
# run adduct grouping #######################################
adduct<-adduct.search(
  peaklist,
  adducts,
  rttol=0.05,
  mztol=3,
  ppm=TRUE,
  use_adducts=c("M+K","M+H","M+Na","M+NH4"),
  ion_mode="positive"
);
plotgroup(pattern,adduct,groupID=3,massrange=10,allmass=FALSE)
#############################################################
## End(No test)



