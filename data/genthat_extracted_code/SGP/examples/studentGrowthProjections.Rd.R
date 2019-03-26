library(SGP)


### Name: studentGrowthProjections
### Title: Student Growth Projections
### Aliases: studentGrowthProjections
### Keywords: misc models

### ** Examples

## Not run: 
##D ## First calculate SGPs for 2014
##D my.grade.sequences <- list(3:4, 3:5, 3:6, 3:7, 4:8)
##D my.sgpData <- list(Panel_Data = sgpData)
##D 
##D for (i in seq_along(my.grade.sequences)) {
##D 	my.sgpData <- studentGrowthPercentiles(panel.data=my.sgpData,
##D 		sgp.labels=list(my.year=2014, my.subject="Reading"),
##D 		use.my.knots.boundaries="DEMO",
##D 		grade.progression=my.grade.sequences[[i]])
##D }
##D 
##D ## Calculate Growth Projections
##D 
##D my.grade.progressions <- list(3, 3:4, 3:5, 3:6, 4:7)
##D 
##D for (i in seq_along(my.grade.progressions)) {
##D 	my.sgpData <- studentGrowthProjections(panel.data=my.sgpData,
##D 		sgp.labels=list(my.year=2014, my.subject="Reading"),
##D 		projcuts.digits=0,
##D 		projection.unit="GRADE",
##D 		performance.level.cutscores="DEMO",
##D 		percentile.trajectory.values=c(25, 50, 75),
##D 		grade.progression=my.grade.progressions[[i]])
##D }
##D 
##D ##  Save the Student Growth Projections Results to a .csv file:
##D 
##D write.csv(my.sgpData$SGProjections$READING.2014,
##D file= "2014_Reading_SGProjections.csv", row.names=FALSE, quote=FALSE)
## End(Not run)



