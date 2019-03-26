library(titrationCurves)


### Name: ppt_analyte
### Title: Precipitation Titration Curve: Monitoring pAnalyte
### Aliases: ppt_analyte

### ** Examples

### Simple titration curve with equivalence point
ex13 = ppt_analyte(eqpt = TRUE)
head(ex13)

### Overlay titration curves using different pKsp values 
ppt_analyte(pksp = 16, eqpt = TRUE)
ppt_analyte(pksp = 14, overlay = TRUE)
ppt_analyte(pksp = 12, overlay = TRUE)



