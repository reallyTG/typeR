library(MSnID)


### Name: optimize_filter
### Title: Filter criteria optimization to maximize the number of
###   identifications given the FDR upper threshold
### Aliases: optimize_filter optimize_filter,MSnIDFilter,MSnID-method

### ** Examples

data(c_elegans)

# explicitely adding parameters that will be used for data filtering
msnidObj$msmsScore <- -log10(msnidObj$`MS-GF:SpecEValue`)
msnidObj$absParentMassErrorPPM <- abs(mass_measurement_error(msnidObj))

# Setting up filter object
filtObj <- MSnIDFilter(msnidObj)
filtObj$absParentMassErrorPPM <- list(comparison="<", threshold=10.0)
filtObj$msmsScore <- list(comparison=">", threshold=10.0)

system.time({
    filtObj.grid <- optimize_filter(filtObj, msnidObj, fdr.max=0.01, 
                                    method="Grid", level="peptide", n.iter=50)})
show(filtObj.grid)

# Fine tuning. Nelder-Mead optimization.
system.time({
    filtObj.nm <- optimize_filter(filtObj.grid, msnidObj, fdr.max=0.01, 
                                    method="Nelder-Mead", level="peptide", 
                                    n.iter=50)})
show(filtObj.nm)

# Fine tuning. Simulated Annealing optimization.
system.time({
    filtObj.sann <- optimize_filter(filtObj.grid, msnidObj, fdr.max=0.01, 
                                    method="SANN", level="peptide", n.iter=50)})
show(filtObj.sann)



