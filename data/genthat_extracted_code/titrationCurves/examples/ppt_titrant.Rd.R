library(titrationCurves)


### Name: ppt_titrant
### Title: Precipitation Titration Curve: Monitoring pTitrant
### Aliases: ppt_titrant

### ** Examples

### Simple titration curve with equivalence point
ex14 = ppt_titrant(eqpt = TRUE)
head(ex14)

### Overlay titration curves using different pKsp values 
ppt_titrant(pksp = 16, eqpt = TRUE)
ppt_titrant(pksp = 14, overlay = TRUE)
ppt_titrant(pksp = 12, overlay = TRUE)



