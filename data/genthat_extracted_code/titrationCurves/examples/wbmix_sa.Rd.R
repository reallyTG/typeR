library(titrationCurves)


### Name: wbmix_sa
### Title: Titration Curve for Weak Base Mixture
### Aliases: wbmix_sa

### ** Examples

### Simple titration curve with equivalence points
ex10 = wbmix_sa(eqpt = TRUE)
head(ex10)

### Overlay titration curves using different pKa values
wbmix_sa(pka1 = 5, pka2 = 8, eqpt = TRUE)
wbmix_sa(pka1 = 4, pka2 = 7, overlay = TRUE)
wbmix_sa(pka1 = 6, pka2 = 9, overlay = TRUE)



