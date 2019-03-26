library(cat)


### Name: prelim.cat
### Title: Preliminary manipulations on incomplete categorical data
### Aliases: prelim.cat
### Keywords: models

### ** Examples

data(crimes)
crimes
s <- prelim.cat(crimes[,1:2],crimes[,3])   # preliminary manipulations
s$nmis                      # see number of missing observations per variable
s$r                         # look at missing data patterns



