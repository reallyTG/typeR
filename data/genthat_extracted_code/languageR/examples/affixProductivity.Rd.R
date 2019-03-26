library(languageR)


### Name: affixProductivity
### Title: Affix productivity
### Aliases: affixProductivity
### Keywords: datasets

### ** Examples

## Not run: 
##D data(affixProductivity)
##D affixes.pr = prcomp(affixProductivity[,1:(ncol(affixProductivity)-3)], 
##D center = TRUE, scale. = TRUE)
##D library(lattice)
##D trellis.device()
##D super.sym = trellis.par.get("superpose.symbol")
##D splom(data.frame(affixes.pr$x[,1:3]), 
##D groups = affixProductivity$Registers, 
##D panel = panel.superpose,
##D key = list(title  = "texts in productivity space",
##D text   = list(c("Religious", "Children", "Literary", "Other")),
##D points = list(pch = super.sym$pch[1:4], col = super.sym$col[1:4])))
## End(Not run)



