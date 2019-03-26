library(openCR)


### Name: read.inp
### Title: Import Data from RMark Input Format
### Aliases: read.inp
### Keywords: manip

### ** Examples


datadir <- system.file('extdata', package = 'openCR')
dipperCH <- read.inp(paste0(datadir, '/ed.inp'), ngroups = 2)
summary(dipperCH)




