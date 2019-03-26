library(DEploid)


### Name: plotProportions
### Title: Plot proportions
### Aliases: plotProportions

### ** Examples

## Not run: 
##D plafFile = system.file("extdata", "labStrains.test.PLAF.txt",
##D     package = "DEploid")
##D panelFile = system.file("extdata", "labStrains.test.panel.txt",
##D     package = "DEploid")
##D refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
##D altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
##D PG0390CoverageT = extractCoverageFromTxt(refFile, altFile)
##D PG0390Coverage.deconv = dEploid(paste("-ref", refFile, "-alt", altFile,
##D     "-plaf", plafFile, "-noPanel"))
##D plotProportions(PG0390Coverage.deconv$Proportions, "PG0390-C proportions")
## End(Not run)




