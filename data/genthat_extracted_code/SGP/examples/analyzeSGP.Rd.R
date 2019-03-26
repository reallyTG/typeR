library(SGP)


### Name: analyzeSGP
### Title: Analyze student data to produce student growth percentiles and
###   student growth projections
### Aliases: analyzeSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## analyzeSGP is Step 2 of 5 of abcSGP
##D Demonstration_SGP <- sgpData_LONG
##D Demonstration_SGP <- prepareSGP(Demonstration_SGP)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP)
##D 
##D ## Or (explicitly pass state argument)
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP, state="DEMO")
##D 
##D ###
##D ###  Example uses of the sgp.config argument
##D ###
##D 
##D #  Use only 3 years of Data, for grades 3 to 6
##D #  and only perform analyses for most recent year (2012)
##D 
##D my.custom.config <- list(
##D MATHEMATICS.2013_2014 = list(
##D 	sgp.content.areas=rep("MATHEMATICS", 3), # Note, must be same length as sgp.panel.years
##D 	sgp.panel.years=c('2011_2012', '2012_2013', '2013_2014'),
##D 	sgp.grade.sequences=list(3:4, 3:5, 4:6)),
##D READING.2013_2014 = list(
##D 	sgp.content.areas=rep("READING", 3),
##D 	sgp.panel.years=c('2011_2012', '2012_2013', '2013_2014'),
##D 	sgp.grade.sequences=list(3:4, 3:5, 4:6)))
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP,
##D 	sgp.config=my.custom.config,
##D 	sgp.percentiles.baseline = FALSE,
##D 	sgp.projections.baseline = FALSE,
##D 	sgp.projections.lagged.baseline = FALSE,
##D 	simulate.sgps=FALSE)
##D 
##D 
##D ##  Another example sgp.config list:
##D 
##D #  Use different CONTENT_AREA priors, and only 1 year of prior data
##D my.custom.config <- list(
##D MATHEMATICS.2013_2014.READ_PRIOR = list(
##D 	sgp.content.areas=c("READING", "MATHEMATICS"),
##D 	sgp.panel.years=c('2012_2013', '2013_2014'),
##D 	sgp.grade.sequences=list(3:4, 4:5, 5:6)),
##D READING.2013_2014.MATH_PRIOR = list(
##D 	sgp.content.areas=c("MATHEMATICS", "READING"),
##D 	sgp.panel.years=c('2012_2013', '2013_2014'),
##D 	sgp.grade.sequences=list(3:4, 4:5, 5:6)))
##D 
##D 
##D ## An example showing multiple priors within a single year
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D 
##D DEMO.config <- list(
##D READING.2012_2013 = list(
##D 	sgp.content.areas=c("MATHEMATICS", "READING", "MATHEMATICS", "READING", "READING"),
##D 	sgp.panel.years=c('2010_2011', '2010_2011', '2011_2012', '2011_2012', '2012_2013'),
##D 	sgp.grade.sequences=list(c(3,3,4,4,5), c(4,4,5,5,6), c(5,5,6,6,7), c(6,6,7,7,8))),
##D MATHEMATICS.2012_2013 = list(
##D 	sgp.content.areas=c("READING", "MATHEMATICS", "READING", "MATHEMATICS", "MATHEMATICS"),
##D 	sgp.panel.years=c('2010_2011', '2010_2011', '2011_2012', '2011_2012', '2012_2013'),
##D 	sgp.grade.sequences=list(c(3,3,4,4,5), c(4,4,5,5,6), c(5,5,6,6,7), c(6,6,7,7,8))))
##D 
##D Demonstration_SGP <- analyzeSGP(
##D 		Demonstration_SGP,
##D 		sgp.config=DEMO.config,
##D 		sgp.projections=FALSE,
##D 		sgp.projections.lagged=FALSE,
##D 		sgp.percentiles.baseline=FALSE,
##D 		sgp.projections.baseline=FALSE,
##D 		sgp.projections.lagged.baseline=FALSE,
##D 		sgp.config.drop.nonsequential.grade.progression.variables=FALSE)
##D 
##D 
##D ###
##D ###  Example uses of the parallel.config argument
##D ###
##D 
##D ##  Windows users must use a snow socket cluster:
##D #  possibly a quad core machine with low RAM Memory
##D #  4 workers for percentiles, 2 workers for projections.
##D #  Note the PSOCK type cluster is used for single machines.
##D 
##D Demonstration_SGP <- prepareSGP(sgpData_LONG)
##D Demonstration_SGP <- analyzeSGP(Demonstration_SGP,
##D 	parallel.config=list(
##D 		BACKEND="PARALLEL", TYPE="PSOCK",
##D 		WORKERS=list(PERCENTILES=4,
##D                     PROJECTIONS=2,
##D                     LAGGED_PROJECTIONS=2,
##D                     BASELINE_PERCENTILES=4))
##D 
##D ##  New parallel package - only available with R 2.13 or newer
##D #  Note there are up to 16 workers, and MPI is used,
##D #  suggesting this example is for a HPC cluster, possibly Windows OS.
##D 	...
##D 	parallel.config=list(
##D 		BACKEND="PARALLEL", TYPE="MPI",
##D 		WORKERS=list(PERCENTILES=16,
##D                     PROJECTIONS=8,
##D                     LAGGED_PROJECTIONS=6,
##D                     BASELINE_PERCENTILES=12))
##D 	...
##D 
##D ## FOREACH use cases:
##D 	...
##D 	parallel.config=list(
##D 		BACKEND="FOREACH", TYPE="doParallel",
##D 		WORKERS=3)
##D 	...
##D 
##D 
##D #  NOTE:  This list of parallel.config specifications is NOT exhaustive.
##D #  See examples in analyzeSGP documentation for some others.0
##D 
##D ###
##D ###  Advanced Example: restrict years, recalculate baseline SGP
##D ###  coefficient matrices, and use parallel processing
##D ###
##D 
##D #  Remove existing DEMO baseline coefficient matrices from
##D #  the SGPstateData object so that new ones will be computed.
##D 
##D SGPstateData$DEMO$Baseline_splineMatrix <- NULL
##D 
##D #  set up a customized sgp.config list
##D 
##D 	. . .
##D 
##D #  set up a customized sgp.baseline.config list
##D 
##D 	. . .
##D 
##D #  to be completed
##D 
## End(Not run)



