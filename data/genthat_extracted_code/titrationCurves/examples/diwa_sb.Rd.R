library(titrationCurves)


### Name: diwa_sb
### Title: Titration Curve for Diprotic Weak Acid
### Aliases: diwa_sb

### ** Examples

### Simple titration curve with equivalence points
ex5 = diwa_sb(eqpt = TRUE)
head(ex5)

### Overlay titration curves using different pKa1 and pKa2 values
diwa_sb(pka1 = 5, pka2 = 9, eqpt = TRUE)
diwa_sb(pka1 = 6, pka2 = 10, overlay = TRUE)
diwa_sb(pka1 = 4, pka2 = 8,  overlay = TRUE)



