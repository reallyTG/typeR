library(nontarget)


### Name: make.isos
### Title: Deriving list of m/z isotope differences for input into
###   'pattern.search'.
### Aliases: make.isos

### ** Examples

data(isotopes)
iso<-make.isos(isotopes,
	use_isotopes=c("13C","15N","34S","37Cl","81Br","41K","13C","15N","34S","37Cl","81Br","41K"),
	use_charges=c(1,1,1,1,1,1,2,2,2,2,2,2))



