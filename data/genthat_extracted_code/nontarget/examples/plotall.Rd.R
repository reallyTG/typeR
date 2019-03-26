library(nontarget)


### Name: plotall
### Title: RT vs. m/z scatterplot marking isotope pattern and adduct group
###   peaks.
### Aliases: plotall

### ** Examples

## No test: 

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
plotall(pattern, adduct)

## End(No test)



