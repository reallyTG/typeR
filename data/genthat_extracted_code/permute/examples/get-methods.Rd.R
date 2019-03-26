library(permute)


### Name: get-methods
### Title: Extractor functions to access components of a permutation design
### Aliases: get-methods getBlocks getBlocks.default getBlocks.how
###   getBlocks.permControl getWithin getWithin.default getWithin.how
###   getWithin.permControl getStrata getStrata.default getStrata.how
###   getStrata.permControl getStrata.Plots getType getType.default
###   getType.how getType.permControl getType.Plots getType.Within
###   getMirror getMirror.default getMirror.how getMirror.permControl
###   getMirror.Plots getMirror.Within getConstant getConstant.default
###   getConstant.how getConstant.permControl getConstant.Within getPlots
###   getPlots.default getPlots.how getPlots.permControl getRow
###   getRow.default getRow.how getRow.permControl getRow.Plots
###   getRow.Within getCol getCol.default getCol.how getCol.permControl
###   getCol.Plots getCol.Within getDim getDim.default getDim.how
###   getDim.permControl getDim.Plots getDim.Within getNperm
###   getNperm.default getNperm.how getNperm.permControl getMaxperm
###   getMaxperm.default getMaxperm.how getMaxperm.permControl getMinperm
###   getMinperm.default getMinperm.how getMinperm.permControl getComplete
###   getComplete.default getComplete.how getComplete.permControl getMake
###   getMake.default getMake.how getObserved getObserved.default
###   getObserved.how getAllperms getAllperms.default getAllperms.how
###   getControl getHow getControl.default getControl.allPerms
### Keywords: methods utils

### ** Examples

## extract components from a "how" object
hh <- how()
getWithin(hh)
getNperm(hh)



