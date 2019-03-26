library(GMSimpute)


### Name: missing.sim
### Title: Missing peaks generating procedure for simulation study
### Aliases: missing.sim

### ** Examples

data('tcga.bc.full')
# tcga.bc.full contains mass specturm abundance of 100 metabolites for 30 breast cancer 
# tumor and normal tissue samples without missing values.


simulated.data=missing.sim(tcga.bc.full,total.missing=c(0.2,0.4),random=c(0.3,0.5,0.7),pct.full=0.4)
# Generate missing (NA) values in full abundance matrix tcga.bc.full permuting all scenarios




