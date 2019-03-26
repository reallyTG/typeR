library(DAMisc)


### Name: ziChange
### Title: Maximal First Differences for Zero-Inflated Models
### Aliases: ziChange

### ** Examples

library(pscl)
## Example from the help file for zeroinfl in the pscl package
data("bioChemists", package = "pscl")
fm_zinb <- zeroinfl(art ~ fem + mar + kid5 + phd + ment |
    fem + mar + kid5 + phd + ment, data = bioChemists, dist = "negbin")
typical.bioChem <- data.frame(
	kid5 = 2,
	mar = factor(1, levels=1:2, labels=levels(bioChemists$mar))
	)
ziChange(fm_zinb, data=bioChemists, typical.dat=typical.bioChem, type="zero")	
ziChange(fm_zinb, data=bioChemists, typical.dat=typical.bioChem, type="count")	



