library(RPPanalyzer)


### Name: RPPanalyzer-package
### Title: Read, annotate and normalize reverse phase protein array data
###   and get a brief overview on the biological impact.
### Aliases: RPPanalyzer-package RPPanalyzer
### Keywords: package

### ** Examples

	data(dataI)
	
	bgcorrected <- correctBG(dataI)
	normalized <- normalizeRPPA(bgcorrected,method="proteinDye")
	aggregated <- sample.median(normalized)



