library(ade4)


### Name: ours
### Title: A table of Qualitative Variables
### Aliases: ours
### Keywords: datasets

### ** Examples

data(ours)
if(adegraphicsLoaded()) {
  s1d.boxplot(dudi.acm(ours, scan = FALSE)$l1[, 1], ours)
} else {
  boxplot(dudi.acm(ours, scan = FALSE))
}



