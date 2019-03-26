library(DEploid)


### Name: computeObsWSAF
### Title: Compute observed WSAF
### Aliases: computeObsWSAF

### ** Examples

# Example 1
refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
PG0390CoverageT = extractCoverageFromTxt(refFile, altFile)
obsWSAF = computeObsWSAF(PG0390CoverageT$altCount, PG0390CoverageT$refCount)

# Example 2
vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
PG0390CoverageV = extractCoverageFromVcf(vcfFile)
obsWSAF = computeObsWSAF(PG0390CoverageV$altCount, PG0390CoverageV$refCount)




