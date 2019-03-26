library(titrationCurves)


### Name: triwa_sb
### Title: Titration Curve for Triprotic Weak Acid
### Aliases: triwa_sb

### ** Examples

### Simple titration curve with equivalence points
ex7 = triwa_sb(eqpt = TRUE)
head(ex7)

### Overlay titration curves using different pKa1 and pKa2 values
triwa_sb(pka1 = 4, pka2 = 7, pka3 = 10, eqpt = TRUE)
triwa_sb(pka1 = 3, pka2 = 7, pka3 = 11, overlay = TRUE)
triwa_sb(pka1 = 5, pka2 = 7, pka3 = 9, overlay = TRUE)



