library(SmithWilsonYieldCurve)


### Name: SmithWilsonYieldCurve-package
### Title: Fit yield curves using the Smith-Wilson method
### Aliases: SmithWilsonYieldCurve SmithWilsonYieldCurve-package

### ** Examples

dfInstruments <- data.frame(c("SWAP", "SWAP"), c(1,10), c(1,1), c(0.025, 0.05))
	colnames( dfInstruments ) <- c( "Type", "Tenor", "Frequency", "Rate" )
	Curve <- fFitSmithWilsonYieldCurveToInstruments( dfInstruments, 0.04, 0.1 )
	plot( Curve )



