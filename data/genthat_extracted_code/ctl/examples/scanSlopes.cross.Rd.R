library(ctl)


### Name: scanSlopes.cross
### Title: scanSlopes.cross - Create a slope difference profile between two
###   traits (R/qtl cross object)
### Aliases: scanSlopes.cross
### Keywords: methods

### ** Examples

  library(ctl)
  data(multitrait)      # Arabidopsis Thaliana (R/qtl cross object)
  multitrait$pheno <- multitrait$pheno[,1:4]
  slopes <- scanSlopes.cross(multitrait)
  image(1:nrow(slopes), 1:ncol(slopes), -log10(slopes))



