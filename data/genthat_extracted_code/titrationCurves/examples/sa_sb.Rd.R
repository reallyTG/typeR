library(titrationCurves)


### Name: sa_sb
### Title: Titration Curve for a Strong Acid
### Aliases: sa_sb

### ** Examples

### Simple titration curve with equivalence point
ex1 = sa_sb(eqpt = TRUE)
head(ex1)

### Overlay titration curves
sa_sb(conc.base = 0.10)
sa_sb(conc.base = 0.15, overlay = TRUE)
sa_sb(conc.base = 0.20, overlay = TRUE)



