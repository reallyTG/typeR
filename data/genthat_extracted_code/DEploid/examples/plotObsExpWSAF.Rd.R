library(DEploid)


### Name: plotObsExpWSAF
### Title: Plot WSAF
### Aliases: plotObsExpWSAF

### ** Examples

## Not run: 
##D vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
##D PG0390CoverageV = extractCoverageFromVcf(vcfFile)
##D obsWSAF = computeObsWSAF(PG0390CoverageV$altCount, PG0390CoverageV$refCount)
##D plafFile = system.file("extdata", "labStrains.test.PLAF.txt",
##D  package = "DEploid")
##D PG0390CoverageV.deconv = dEploid(paste("-vcf", vcfFile,
##D                                        "-plaf", plafFile, "-noPanel"))
##D prop = PG0390CoverageV.deconv$Proportions[dim(PG0390CoverageV.deconv$Proportions)[1],]
##D expWSAF = t(PG0390CoverageV.deconv$Haps) %*% prop
##D plotObsExpWSAF(obsWSAF, expWSAF)
## End(Not run)




