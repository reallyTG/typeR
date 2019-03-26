library(titrationCurves)


### Name: redox_titration
### Title: Redox Titration Curve
### Aliases: redox_titration

### ** Examples

### Simple titration curve with equivalence point
ex12 = redox_titration(eqpt = TRUE)
head(ex12)

### Overlay titration curves using different potentials for tirant
redox_titration(pot.titrant = 1.7, eqpt = TRUE)
redox_titration(pot.titrant = 1.5, overlay = TRUE)
redox_titration(pot.titrant = 1.3, overlay = TRUE)



