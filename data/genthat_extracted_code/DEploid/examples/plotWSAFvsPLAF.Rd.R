library(DEploid)


### Name: plotWSAFvsPLAF
### Title: Plot WSAF vs PLAF
### Aliases: plotWSAFvsPLAF

### ** Examples

# Example 1
refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
PG0390CoverageT = extractCoverageFromTxt(refFile, altFile)
obsWSAF = computeObsWSAF(PG0390CoverageT$altCount, PG0390CoverageT$refCount)
plafFile = system.file("extdata", "labStrains.test.PLAF.txt",
  package = "DEploid")
plaf = extractPLAF(plafFile)
plotWSAFvsPLAF(plaf, obsWSAF)

# Example 2
vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
PG0390CoverageV = extractCoverageFromVcf(vcfFile)
obsWSAF = computeObsWSAF(PG0390CoverageV$altCount, PG0390CoverageV$refCount)
plafFile = system.file("extdata", "labStrains.test.PLAF.txt",
  package = "DEploid")
plaf = extractPLAF(plafFile)
plotWSAFvsPLAF(plaf, obsWSAF)




