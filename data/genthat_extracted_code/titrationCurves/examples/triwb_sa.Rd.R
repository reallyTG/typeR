library(titrationCurves)


### Name: triwb_sa
### Title: Titration Curve for a Triprotic Weak Base
### Aliases: triwb_sa

### ** Examples

### Simple titration curve with equivalence points
ex8 = triwb_sa(eqpt = TRUE)
head(ex8)

### Overlay titration curves using different pKa1 and pKa2 values
triwb_sa(pka1 = 4, pka2 = 7, pka3 = 10, eqpt = TRUE)
triwb_sa(pka1 = 3, pka2 = 7, pka3 = 11, overlay = TRUE)
triwb_sa(pka1 = 5, pka2 = 7, pka3 = 9, overlay = TRUE)



