library(titrationCurves)


### Name: wa_sb
### Title: Titration Curve for a Weak Acid
### Aliases: wa_sb

### ** Examples

### Simple titration curve with equivalence point
ex3 = wa_sb(eqpt = TRUE)
head(ex3)

### Overlay titration curves using different pKa values
wa_sb(pka = 5, eqpt = TRUE)
wa_sb(pka = 7, overlay = TRUE)
wa_sb(pka = 9, overlay = TRUE)

### Overlay titration curve for strong acid and weak acid
sa_sb(eqpt = TRUE)
wa_sb(overlay = TRUE)



