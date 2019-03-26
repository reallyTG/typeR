library(nontarget)


### Name: plotdefect
### Title: Mass defect vs. m/z scatterplot of HRMS peaks, with specific m/z
###   isotope differences highlighted.
### Aliases: plotdefect

### ** Examples

## No test: 
data(peaklist);

peaklist<-rm.sat(peaklist,dmz=0.3,drt=0.1,intrat=0.015,spar=0.8,corcut=-1000,plotit=TRUE);

peaklist<-peaklist[peaklist[,4],1:3];

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

plotdefect(pattern,elements=c("N"));
plotdefect(pattern,elements=c("Cl"));
plotdefect(pattern,elements=c("Br"));
plotdefect(pattern,elements=c("S"));
plotdefect(pattern,elements=c("C"));
plotdefect(pattern,elements=c("K"));
# P has only one isotope, hence:
# plotdefect(pattern,elements=c("P"));
## End(No test)



