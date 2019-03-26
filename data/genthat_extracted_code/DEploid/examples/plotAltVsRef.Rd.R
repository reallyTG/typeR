library(DEploid)


### Name: plotAltVsRef
### Title: Plot coverage
### Aliases: plotAltVsRef

### ** Examples

# Example 1
refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
PG0390CoverageT = extractCoverageFromTxt(refFile, altFile)
plotAltVsRef(PG0390CoverageT$refCount, PG0390CoverageT$altCount)

# Example 2
vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
PG0390CoverageV = extractCoverageFromVcf(vcfFile)
plotAltVsRef(PG0390CoverageV$refCount, PG0390CoverageV$altCount)




