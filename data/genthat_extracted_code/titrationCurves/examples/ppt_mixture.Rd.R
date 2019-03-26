library(titrationCurves)


### Name: ppt_mixture
### Title: Precipitation Titration Curve: Mixture of Analytes
### Aliases: ppt_mixture

### ** Examples

### Simple titration curve with equivalence points
ex15 = ppt_mixture(eqpt = TRUE)
head(ex15)

### Overlay mixture titration curves using different pKsp values 
ppt_mixture(pksp1 = 16, pksp2 = 12, eqpt = TRUE)
ppt_mixture(pksp1 = 14, pksp2 = 10, overlay = TRUE)



