library(titrationCurves)


### Name: sb_sa
### Title: Titration Curve for a Strong Base
### Aliases: sb_sa

### ** Examples

### Simple titration curve with equivalence point
ex2 = sb_sa(eqpt = TRUE)
head(ex2)

### Overlay titration curves
sb_sa(conc.acid = 0.10)
sb_sa(conc.acid = 0.15, overlay = TRUE)
sb_sa(conc.acid = 0.20, overlay = TRUE)



