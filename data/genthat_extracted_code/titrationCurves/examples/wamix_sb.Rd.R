library(titrationCurves)


### Name: wamix_sb
### Title: Titration Curve for Weak Acid Mixture
### Aliases: wamix_sb

### ** Examples

### Simple titration curve with equivalence points
ex9 = wamix_sb(eqpt = TRUE)
head(ex9)

### Overlay titration curves using different pKa values
wamix_sb(pka1 = 5, pka2 = 8, eqpt = TRUE)
wamix_sb(pka1 = 4, pka2 = 7, overlay = TRUE)
wamix_sb(pka1 = 6, pka2 = 9, overlay = TRUE)



