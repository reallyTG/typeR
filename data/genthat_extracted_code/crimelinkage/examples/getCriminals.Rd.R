library(crimelinkage)


### Name: getCriminals
### Title: Lookup the offenders responsible for a set of solved crimes
### Aliases: getCriminals

### ** Examples

data(offenders)

 getCriminals("C:1",offenders)

 getCriminals("C:78",offenders)                      # shows co-offenders

 getCriminals(c("C:26","C:78","85","110"),offenders) # all offenders from a crime series



