library(nontarget)


### Name: nontarget-package
### Title: Detecting Isotope, Adduct and Homologue Relations in LC-MS Data.
### Aliases: nontarget-package nontarget
### Keywords: package

### ** Examples

## No test: 
######################################################
# (0) load required data: ############################
# (0.1) HRMS peak list & remove satelite peaks: ######
data(peaklist);
peaklist<-rm.sat(peaklist,dmz=0.3,drt=0.1,intrat=0.015,spar=0.8,corcut=-1000,plotit=TRUE);
peaklist<-peaklist[peaklist[,4],1:3];
# (0.2) list of adducts - package enviPat ############
data(adducts);
# (0.3) list of isotopes - package enviPat ###########
data(isotopes);
######################################################
# (1) run isotope pattern grouping ###################
# (1.1) define isotopes and charge argument ##########
iso<-make.isos(isotopes,
	use_isotopes=c("13C","15N","34S","37Cl","81Br","41K","13C","15N","34S","37Cl","81Br","41K"),
	use_charges=c(1,1,1,1,1,1,2,2,2,2,2,2))
# (1.2) run isotope grouping #########################
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
# (1.3) plot results #################################
plotisotopes(pattern);
plotdefect(pattern,elements=c("N"));
######################################################
# (2.1) run grouping of peaks for different adducts ##
# of the same candidate molecule #####################
adduct<-adduct.search(
  peaklist,
  adducts,
  rttol=0.05,
  mztol=3,
  ppm=TRUE,
  use_adducts=c("M+K","M+H","M+Na","M+NH4"),
  ion_mode="positive"
);
# (2.2) plot results #################################
plotadduct(adduct);
######################################################
# (3) show single pattern group and its relation #####
# to adduct groups ###################################
plotall(pattern,adduct);
plotgroup(pattern,adduct,groupID=1,massrange=10,allmass=FALSE);
######################################################
# (4.1) Screen for homologue series ##################
homol<-homol.search(
	peaklist,
	isotopes,	
	elements=c("C","H","O"),
	use_C=TRUE,
	minmz=5,
	maxmz=120,
	minrt=-1,
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
# (4.2) Plot results #################################
plothomol(homol,xlim=FALSE,ylim=FALSE,plotlegend=TRUE);
######################################################
# (5.1) Combine grouping results to components #######
comp<-combine(
	pattern,
	adduct,
	homol,
	dont=FALSE,
	rules=c(TRUE,FALSE,FALSE)
);
# (5.2) plot results ################################# 
plotisotopes(comp);
plotcomp(comp,compoID=1,peakID=FALSE);
######################################################
# (6) Select data from interactive plot ##############
# ms.filter( component=comp,x="mz",y="dm",xlim=FALSE,
# ylim=FALSE,rm.comp=TRUE,plot.comp=TRUE,rm.noncomp=FALSE,
# select.polygon="inside",res=100,filter.for="raw" );
######################################################

## End(No test)



