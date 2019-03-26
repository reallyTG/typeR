library(nontarget)


### Name: combine
### Title: Combining isotope, adduct and homologue series relations in HRMS
###   data sets.
### Aliases: combine

### ** Examples

## No test: 

######################################################
# (0) Group for isotopologues, adducts & homologues  # 
data(peaklist);
data(adducts);
data(isotopes);
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
adduct<-adduct.search(
  peaklist,
  adducts,
  rttol=0.05,
  mztol=3,
  ppm=TRUE,
  use_adducts=c("M+K","M+H","M+Na","M+NH4"),
  ion_mode="positive"
);
homol<-homol.search(
	peaklist,
	isotopes,	
	elements=c("C","H","O"),
	use_C=TRUE,
	minmz=5,
	maxmz=120,
	minrt=1,
	maxrt=2,
	ppm=TRUE,
	mztol=3.5,
    rttol=0.5,
	minlength=5,
	mzfilter=FALSE,
	vec_size=3E6,
	spar=.45,
	R2=.98,
	plotit=FALSE
)
##############################################################
# Combine these individual groups to components              #
##############################################################
# (1) Standard setting:                                      #
# Produce a component list, allowing for single-peaked       #
# components and with interfering peaks also listed as indi- #
# vidual components (with inputs pattern,adduct,homol):      #
comp<-combine(
	pattern,
	adduct,
	homol,
	dont=FALSE,
	rules=c(TRUE,FALSE,FALSE)
);
comp[[6]];
##############################################################
# (2) Produce a list with those components related to a homo-#
# logue series only (requires inputs pattern,adduct,homol):  #
comp<-combine(
	pattern,
	adduct,
	homol,
	dont=FALSE,
	rules=c(TRUE,FALSE,TRUE)
);
comp[[6]];
##############################################################
# (3) Extract only components that are plausible and contain #
# more than one peak per component, without homologue series #
# information attached (with inputs pattern and adduct):     #
comp<-combine(
	pattern,
	adduct,
	homol=FALSE,
	dont=c(1,2,3),
	rules=c(TRUE,TRUE,FALSE)
);
comp[[6]];
##############################################################

## End(No test)



