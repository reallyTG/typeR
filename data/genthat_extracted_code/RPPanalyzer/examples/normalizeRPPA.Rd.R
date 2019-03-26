library(RPPanalyzer)


### Name: normalizeRPPA
### Title: Normalizes data in an RPPA data list
### Aliases: normalizeRPPA
### Keywords: manip

### ** Examples

	library(RPPanalyzer)
	data(dataI)
	dataI_bgcorr <- correctBG(dataI,method="normexp")
	dataIb <- pick.high.conc(dataI_bgcorr,highest="dilution")
	normRow <- normalizeRPPA(dataIb,method="row")
	normDye <- normalizeRPPA(dataIb,method="proteinDye")
	normPassay <- normalizeRPPA(dataIb,method="extValue",useCol="concentration")
	normHK <-  normalizeRPPA(dataIb,method="housekeeping",normalizer="housekeeping")



