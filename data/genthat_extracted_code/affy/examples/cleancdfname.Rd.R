library(affy)


### Name: cleancdfname
### Title: Clean Affymetrix's CDF name
### Aliases: cleancdfname mapCdfName
### Keywords: character

### ** Examples

cdf.tags <- c("HG_U95Av2", "HG-133A")
for (i in cdf.tags)
  cat(i, "becomes", cleancdfname(i), "\n")



