library(icesDatras)


### Name: checkSurveyYearQuarterOK
### Title: Check that a survey, year and quarter combination is in the
###   database
### Aliases: checkSurveyYearQuarterOK

### ** Examples

## Not run: 
##D checkSurveyYearQuarterOK(survey = "ROCKALL", 2015, 3)
##D checkSurveyYearQuarterOK(survey = "ROCKALL", 2015, 1)
##D checkSurveyYearQuarterOK(survey = "ROCKALL", 2000, 1)
##D checkSurveyYearQuarterOK(survey = "NOTALL", 2000, 1)
##D 
##D # be careful of unexpected results with checksurvey and checkyear!
##D checkSurveyYearQuarterOK(survey = "NOTALL", 2000, 1, checksurvey=FALSE)
## End(Not run)



