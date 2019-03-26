library(MLDS)


### Name: ix.mat2df
### Title: Transform data.frame back to Raw Difference Scale Format
### Aliases: ix.mat2df
### Keywords: manip

### ** Examples

	
data(AutumnLab)
ix.mat <- make.ix.mat(AutumnLab)
#orig.df <- ix.mat2df(ix.mat) # should be the same as original
# better to use as.mlds.df as ix.mat2df is deprecated
orig.df <- as.mlds.df(ix.mat) 




