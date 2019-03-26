library(SGP)


### Name: courseProgressionSGP
### Title: Identify potential course progressions for SGP analyses
### Aliases: courseProgressionSGP
### Keywords: documentation

### ** Examples

## Not run: 
##D ## Run courseProgressionSGP on the subset of the long data that contains 
##D ## ONLY mathematics related records (would realistically also contain EOCT math courses)
##D Math_Data <- subset(SGPdata::sgpData_LONG, CONTENT_AREA == "MATHEMATICS")
##D Math_Progressions <- courseProgressionSGP(Math_Data, lag.direction= "BACKWARD", year="2015_2016")
##D 
##D ##  Examine results for Adcademic Year 2015-2016, 5th grade Mathematics.
##D Math_Progressions[['BACKWARD']][['2015_2016']][['MATHEMATICS.05']]
##D Math_Progressions[['BACKWARD']][['2015_2016']][['MATHEMATICS.05']][COUNT>100]
## End(Not run)  



