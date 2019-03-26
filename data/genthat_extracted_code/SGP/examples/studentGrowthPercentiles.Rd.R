library(SGP)


### Name: studentGrowthPercentiles
### Title: Student Growth Percentiles
### Aliases: studentGrowthPercentiles
### Keywords: misc models

### ** Examples

## Not run: 
##D ## Calculate 4th grade student growth percentiles using included sgpData
##D 
##D require(SGPdata)
##D sgp_g4 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		subset.grade=4,
##D 		num.prior=1)
##D 
##D ## NOTE: "grade.progression" can be used in place of "subset.grade" and "num.prior"
##D 
##D sgp_g4_v2 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		grade.progression=c(3,4))
##D 
##D identical(sgp_g4$SGPercentiles, sgp_g4_v2$SGPercentiles)
##D 
##D ## Established state Knots and Boundaries are available in the supplied SGPstateData
##D ## file and used by supplying the appropriate two letter state acronym.
##D 
##D sgp_g4_DEMO <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		use.my.knots.boundaries="DEMO",
##D 		grade.progression=c(3,4))
##D 
##D 
##D ## Sample code for running non-sequential grade progression analysis.
##D 
##D sgp_g8_DEMO <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		use.my.knots.boundaries="DEMO",
##D 		grade.progression=c(5,6,8))
##D 
##D 
##D ## NOTE: Unless specified with 'goodness.of.fit.output.format'
##D ## Goodness of Fit results are stored as graphical objects in the
##D ## Goodness_of_Fit slot. To view or save (using any R output device) try:
##D ## Load 'grid' package to access grid.draw function
##D 
##D require(grid)
##D grid.draw(sgp_g4$Goodness_of_Fit$READING.2054[[1]])
##D 
##D require(grid)
##D pdf(file="Grade_4_Reading_2015_GOF.pdf", width=8.5, height=8)
##D grid.draw(sgp_g4$Goodness_of_Fit$READING.2015[[1]])
##D dev.off()
##D 
##D # Other grades
##D 
##D sgp_g5 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		grade.progression=3:5)
##D 
##D sgp_g6 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		grade.progression=3:6)
##D 
##D sgp_g7 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		grade.progression=3:7)
##D 
##D sgp_g8 <- studentGrowthPercentiles(
##D 		panel.data=sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		percentile.cuts=c(1,35,65,99),
##D 		grade.progression=4:8)
##D 
##D ## All output of studentGrowthPercentiles (e.g., coefficient matrices) is contained
##D ## in the object.  See, for example, names(sgp_g8), for all included objects.
##D ## Results are stored in the slot SGPercentiles.
##D 
##D # Combine all results
##D 
##D sgp_all <- rbind(
##D 		sgp_g4$SGPercentiles$READING.2015,
##D 		sgp_g5$SGPercentiles$READING.2015,
##D 		sgp_g6$SGPercentiles$READING.2015,
##D 		sgp_g7$SGPercentiles$READING.2015,
##D 		sgp_g8$SGPercentiles$READING.2015)
##D 
##D # Save SGP results to .csv file
##D 
##D write.csv(sgp_all, file="sgp_all.csv", row.names=FALSE, quote=FALSE, na="")
##D 
##D 
##D ## NOTE: studentGrowthPercentiles ADDs results to the current SGP object.
##D ## This allows one to "recycle" the object for multiple grades and subjects as desired.
##D 
##D # Loop to calculate all SGPs for all grades without percentile cuts
##D # but with growth levels and goodness of fit plots exported automatically as PDFs, PNGs, and SVGs
##D 
##D my.grade.sequences <- list(3:4, 3:5, 3:6, 3:7, 4:8)
##D my.sgpData <- list(Panel_Data=sgpData)   ### Put sgpData into Panel_Data slot
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		growth.levels="DEMO",
##D 		goodness.of.fit="DEMO",
##D         goodness.of.fit.output.format=c("PDF", "PNG", "SVG"),
##D 		grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D #  Save Student Growth Percentiles results to a .csv file:
##D 
##D write.csv(my.sgpData$SGPercentiles$READING.2015,
##D file="2015_Reading_SGPercentiles.csv", row.names=FALSE, quote=FALSE, na="")
##D 
##D ## Loop to calculate all SGPs for all grades using 2010 to 2013 data
##D 
##D my.grade.sequences <- list(3:4, 3:5, 3:6, 3:7, 4:8)
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData_2009 <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 		panel.data.vnames=c("ID", "GRADE_2010",
##D 			"GRADE_2011", "GRADE_2012", "GRADE_2013",
##D 			"SS_2010", "SS_2011", "SS_2012", "SS_2013"),
##D 		sgp.labels=list(my.year=2013, my.subject="Reading"),
##D 		grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D 
##D ## Loop to calculate all SGPs for all grades WITH 80##D 
##D 
##D my.grade.sequences <- list(3:4, 3:5, 3:6, 3:7, 4:8)
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 	sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 	calculate.confidence.intervals=list(state="DEMO",
##D 	confidence.quantiles=c(0.1, 0.9), simulation.iterations=100,
##D 		distribution="Normal", round=1),
##D 	grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D ### Example showing how to use pre-calculated coefficient
##D ### matrices to calculate student growth percentiles
##D 
##D my.grade.sequences <- list(3:4, 3:5, 3:6, 3:7, 4:8)
##D my.sgpData <- list(Panel_Data=sgpData)   ### Put sgpData into Panel_Data slot
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		growth.levels="DEMO",
##D 		grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D percentiles.1st.run <- my.sgpData$SGPercentiles$READING.2015
##D 
##D ### my.sgpData has as full set of coefficient matrices for Reading, 2015. To view these
##D 
##D names(my.sgpData$Coefficient_Matrices$READING.2015)
##D 
##D ## Let's NULL out the SGPercentiles slot and recreate the percentiles
##D ## using the embedded coefficient matrices
##D 
##D my.sgpData$SGPercentiles$READING.2015 <- NULL
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 		sgp.labels=list(my.year=2015, my.subject="Reading"),
##D 		use.my.knots.boundaries=list(my.year=2015, my.subject="Reading"),
##D 		use.my.coefficient.matrices=list(my.year=2015, my.subject="Reading"),
##D 		growth.levels="DEMO",
##D 		grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D percentiles.2nd.run <- my.sgpData$SGPercentiles$READING.2015
##D 
##D identical(percentiles.1st.run, percentiles.2nd.run)
##D 
## End(Not run)



