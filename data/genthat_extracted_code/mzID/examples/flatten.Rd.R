library(mzID)


### Name: flatten
### Title: Flatten an mzID related class into a table
### Aliases: flatten flatten,mzID-method flatten,mzIDCollection-method
###   flatten,mzIDpeptides-method flatten,mzIDpsm-method

### ** Examples

exampleFile <- system.file('extdata', '55merge_tandem.mzid', package = 'mzID')
mzResults <- mzID(exampleFile)
head(flatten(mzResults))




