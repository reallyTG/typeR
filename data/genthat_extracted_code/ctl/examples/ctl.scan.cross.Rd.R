library(ctl)


### Name: CTLscan.cross
### Title: CTLscan.cross - Scan for Correlated Trait Locus (CTL) (R/qtl
###   cross object)
### Aliases: CTLscan.cross
### Keywords: methods

### ** Examples

  library(ctl)
  data(multitrait)      # Arabidopsis Thaliana (R/qtl cross object)

  mtrait <- calc.genoprob(multitrait)          # Calculate genotype probabilities
  qtls   <- scanone(mtrait, pheno.col = 1)     # Scan for QTLS using R/qtl

  ctls   <- CTLscan.cross(mtrait, phenocol = 1, qtl = FALSE)
  ctls[[1]]$qtl <- qtls[,3]

  ctl.lineplot(ctls, qtls[,1:2], significance = 0.05) # Line plot all the phenotypes

  summary <- CTLsignificant(ctls)              # Get a list of significant CTLs
  summary



