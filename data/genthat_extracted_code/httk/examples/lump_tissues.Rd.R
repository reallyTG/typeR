library(httk)


### Name: lump_tissues
### Title: Lump tissue parameters
### Aliases: lump_tissues
### Keywords: Parameter

### ** Examples

pcs <- predict_partitioning_schmitt(chem.name='bisphenola')
tissuelist <- list(liver=c("liver"),kidney=c("kidney"),lung=c("lung"),gut=c("gut")
,muscle.bone=c('muscle','bone'))
lump_tissues(pcs,tissuelist=tissuelist)



