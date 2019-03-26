library(camtrapR)


### Name: surveyReport
### Title: Create a report about a camera trapping survey and species
###   detections
### Aliases: surveyReport

### ** Examples

data(camtraps)
data(recordTableSample)

reportTest <- surveyReport (recordTable          = recordTableSample,
                            CTtable              = camtraps,
                            speciesCol           = "Species",
                            stationCol           = "Station",
                            setupCol             = "Setup_date",
                            retrievalCol         = "Retrieval_date",
                            CTDateFormat         = "%d/%m/%Y", 
                            recordDateTimeCol    = "DateTimeOriginal",
                            recordDateTimeFormat = "%Y-%m-%d %H:%M:%S")

class(reportTest)  # a list with
length(reportTest) # 5 elements

reportTest[[1]]    # camera trap operation times and image date ranges
reportTest[[2]]    # number of species by station
reportTest[[3]]    # number of events and number of stations by species
reportTest[[4]]    # number of species events by station
reportTest[[5]]    # number of species events by station including 0s (non-observed species)

# with camera problems

reportTest_problem <- surveyReport (recordTable          = recordTableSample,
                                    CTtable              = camtraps,
                                    speciesCol           = "Species",
                                    stationCol           = "Station",
                                    setupCol             = "Setup_date",
                                    retrievalCol         = "Retrieval_date",
                                    CTDateFormat         = "%d/%m/%Y", 
                                    recordDateTimeCol    = "DateTimeOriginal",
                                    recordDateTimeFormat = "%Y-%m-%d %H:%M:%S",
                                    CTHasProblems        = TRUE)

reportTest_problem$survey_dates

## Not run: 
##D # run again with sinkpath defined
##D reportTest <- surveyReport (recordTable          = recordTableSample,
##D                             CTtable              = camtraps,
##D                             speciesCol           = "Species",
##D                             stationCol           = "Station",
##D                             setupCol             = "Setup_date",
##D                             retrievalCol         = "Retrieval_date",
##D                             CTDateFormat         = "%d/%m/%Y", 
##D                             recordDateTimeCol    = "DateTimeOriginal",
##D                             recordDateTimeFormat = "%Y-%m-%d %H:%M:%S",
##D                             sinkpath             = getwd())
##D 
##D # have a look at the text file
##D readLines(list.files(getwd(), pattern = paste("survey_report_", Sys.Date(), ".txt", sep = ""), 
##D 					 full.names = TRUE))
## End(Not run)



