library(aroma.affymetrix)


### Name: createExonByTranscriptCdf.AffymetrixCdfFile
### Title: Creates an exon-by-transcript CDF
### Aliases: createExonByTranscriptCdf.AffymetrixCdfFile
###   AffymetrixCdfFile.createExonByTranscriptCdf
###   createExonByTranscriptCdf,AffymetrixCdfFile-method
### Keywords: internal methods

### ** Examples
## Not run: 
##D # The exon-only CDF
##D cdf <- AffymetrixCdfFile$byChipType("HuEx-1_0-st-v2")
##D 
##D # The NetAffx probeset annotation data file
##D csv <- AffymetrixNetAffxCsvFile("HuEx-1_0-st-v2.na24.hg18.probeset.csv", path=getPath(cdf))
##D 
##D # Create a CDF containing all core probesets:
##D cdfT <- createExonByTranscriptCdf(cdf, csv=csv, tags=c("*,HB20110911"))
##D print(cdfT)
##D 
##D # Create CDF containing the core probesets with 3 or 4 probes:
##D cdfT2 <- createExonByTranscriptCdf(cdf, csv=csv,
##D             tags=c("*,bySize=3-4,HB20110911"),
##D             subsetBy="probeCount", within=c("3", "4"))
##D print(cdfT2)
## End(Not run)


