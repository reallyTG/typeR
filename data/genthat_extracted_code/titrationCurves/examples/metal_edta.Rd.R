library(titrationCurves)


### Name: metal_edta
### Title: Complexation Titration Curve
### Aliases: metal_edta

### ** Examples

### Simple titration curve with equivalence point
ex11 = metal_edta(eqpt = TRUE)
head(ex11)

### Overlay titration curves using different pH values
metal_edta(ph = 12, eqpt = TRUE)
metal_edta(ph = 10, overlay = TRUE)
metal_edta(ph = 8, overlay = TRUE)



