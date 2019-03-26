library(SGP)


### Name: visualizeSGP
### Title: Visualize data from SGP analyses
### Aliases: visualizeSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## visualizeSGP is Step 5 of 5 of abcSGP
##D Demonstration_SGP <- sgpData_LONG
##D Demonstration_SGP <- prepareSGP(Demonstration_SGP)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP)
##D Demonstration_SGP <- combineSGP(Demonstration_SGP)
##D Demonstration_SGP <- summarizeSGP(Demonstration_SGP)
##D visualizeSGP(Demonstration_SGP)
##D 
##D ## Produce a DEMO catalog of student growth plots
##D 
##D visualizeSGP(
##D 	sgp_object=Demonstration_SGP,
##D 	plot.types="studentGrowthPlot",
##D 	state="DEMO",
##D 	sgPlot.demo.report=TRUE)
##D 
##D ## Production of sample student growth and achievement plots
##D 
##D visualizeSGP(
##D 	sgp_object=Demonstration_SGP,
##D 	plot.types="studentGrowthPlot",
##D 	state="DEMO",
##D 	sgPlot.districts=470,
##D 	sgPlot.schools=c(6418, 8008),
##D 	sgPlot.header.footer.color="#4CB9CC")
## End(Not run)



