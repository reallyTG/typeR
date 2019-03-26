library(DEploid)


### Name: histWSAF
### Title: WSAF histogram
### Aliases: histWSAF

### ** Examples

# Example 1
refFile = system.file("extdata", "PG0390-C.test.ref", package = "DEploid")
altFile = system.file("extdata", "PG0390-C.test.alt", package = "DEploid")
PG0390Coverage = extractCoverageFromTxt(refFile, altFile)
obsWSAF = computeObsWSAF(PG0390Coverage$altCount, PG0390Coverage$refCount)
histWSAF(obsWSAF)
myhist = histWSAF(obsWSAF, FALSE)

# Example 2
vcfFile = system.file("extdata", "PG0390-C.test.vcf.gz", package = "DEploid")
PG0390CoverageV = extractCoverageFromVcf(vcfFile)
obsWSAF = computeObsWSAF(PG0390CoverageV$altCount, PG0390CoverageV$refCount)
histWSAF(obsWSAF)
myhist = histWSAF(obsWSAF, FALSE)




