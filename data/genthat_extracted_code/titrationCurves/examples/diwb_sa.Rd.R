library(titrationCurves)


### Name: diwb_sa
### Title: Titration Curve for Diprotic Weak Base
### Aliases: diwb_sa

### ** Examples

### Simple titration curve with equivalence points
ex6 = diwb_sa(eqpt = TRUE)
head(ex6)

### Overlay titration curves using different pKa1 and pKa2 values
diwb_sa(pka1 = 5, pka2 = 9, eqpt = TRUE)
diwb_sa(pka1 = 6, pka2 = 10, overlay = TRUE)
diwb_sa(pka1 = 4, pka2 = 8,  overlay = TRUE)



