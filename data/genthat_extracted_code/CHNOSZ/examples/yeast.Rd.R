library(CHNOSZ)


### Name: yeast
### Title: Composition, Localization, and Abundances of Proteins in Yeast
### Aliases: yeast yeast.aa yeastgfp

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
# the first few names in UniProt for "aminotransferase yeast"
genes <- c("AATC", "ARO8", "BCA1", "AMPL", "BCA2", "ARO9")
# the corresponding ORF names
ORF <- c("YLR027C", "YGL202W", "YHR208W", "YKL103C", "YJR148W", "YHR137W")
# we only match two of them by gene name, but all by ORF name
aa <- yeast.aa(genes)
aa <- yeast.aa(ORF)
# what are their formulas and average oxidation states of carbon
protein.formula(aa)
ZC(protein.formula(aa))

## potential fields for overall protein compositions 
## transcriptionally induced and repressed in aerobic
## and anaerobic carbon limitation
## (experiments of Tai et al., 2005)
# the activities of ammonium and sulfate used here
# are similar to the non-growth-limiting concentrations
# used by Boer et al., 2003
basis(c("glucose", "H2O", "NH4+", "hydrogen", "SO4-2", "H+"),
  c(-1, 0, -1.3, 999, -1.4, -7))
# the names of the experiments in TBD+05.csv
expt <- c("Clim.aerobic.down", "Clim.aerobic.up",
  "Clim.anaerobic.down", "Clim.anaerobic.up")
file <- system.file("extdata/abundance/TBD+05.csv", package="CHNOSZ")
dat <- read.csv(file, as.is=TRUE)
# yeast.aa: get the amino acid compositions
# aasum: average them together
for(thisexpt in expt) {
  p <- dat$protein[dat[, thisexpt]]
  aa <- yeast.aa(p)
  aa <- aasum(aa, average=TRUE, protein=thisexpt)
  add.protein(aa)
}
species(expt, "Sce")
a <- affinity(C6H12O6=c(-30, 0), H2=c(-20, 0))
d <- diagram(a, normalize=TRUE, fill=NULL)
title(main=paste("Formation potential of proteins associated with\n",
  "transcriptional response to carbon limitation in yeast"))
# the affinity of formation favors the proteins upregulated 
# by carbon limitation at low chemical potentials of C6H12O6 ...
stopifnot(c(d$predominant[1,1], d$predominant[1,128])==grep("up", expt))
# ... and favors proteins downregulated by aerobic conditions
# at high hydrogen fugacities
stopifnot(c(d$predominant[128, 128], d$predominant[128, 1])==grep("down", expt))

## overall oxidation state of proteins exclusively localized 
## to cytoplasm of S. cerevisiae with/without abundance weighting
y <- yeastgfp("cytoplasm")
aa <- yeast.aa(y$protein)
aaavg <- aasum(aa, average=TRUE)
ZC(protein.formula(aaavg))
# the average composition weighted by abundance
waaavg <- aasum(aa, abundance=y$abundance, average=TRUE)
ZC(protein.formula(waaavg))



