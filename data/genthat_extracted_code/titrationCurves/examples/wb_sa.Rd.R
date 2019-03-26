library(titrationCurves)


### Name: wb_sa
### Title: Titration Curve for a Weak Base
### Aliases: wb_sa

### ** Examples

### Simple titration curve with equivalence point
ex4 = wb_sa(eqpt = TRUE)
head(ex4)

### Overlay titration curves using different pKa values
wb_sa(pka = 9, eqpt = TRUE)
wb_sa(pka = 7, overlay = TRUE)
wb_sa(pka = 5, overlay = TRUE)

### Overlay titration curve for strong base and weak base
sb_sa(eqpt = TRUE)
wb_sa(overlay = TRUE)



