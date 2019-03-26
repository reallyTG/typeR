library(camtrapR)


### Name: detectionHistory
### Title: Species detection histories for occupancy analyses
### Aliases: detectionHistory

### ** Examples


# define image directory
wd_images_ID <- system.file("pictures/sample_images", package = "camtrapR")

# load station information
data(camtraps)

# create camera operation matrix
camop_no_problem <- cameraOperation(CTtable      = camtraps,
                                    stationCol   = "Station",
                                    setupCol     = "Setup_date",
                                    retrievalCol = "Retrieval_date",
                                    hasProblems  = FALSE,
                                    dateFormat   = "%d/%m/%Y"
)


if (Sys.which("exiftool") != ""){        # only run this function if ExifTool is available
recordTableSample <- recordTable(inDir               = wd_images_ID,
                                 IDfrom              = "directory",
                                 minDeltaTime        = 60,
                                 deltaTimeComparedTo = "lastRecord",
                                 exclude             = "NO_ID",
                                 timeZone            = "Asia/Kuala_Lumpur"
)
} else {
data(recordTableSample)
}

# compute detection history for a species

# without trapping effort
DetHist1 <- detectionHistory(recordTable         = recordTableSample,
                            camOp                = camop_no_problem,
                            stationCol           = "Station",
                            speciesCol           = "Species",
                            recordDateTimeCol    = "DateTimeOriginal",
                            species              = "VTA",
                            occasionLength       = 7,
                            day1                 = "station",
                            datesAsOccasionNames = FALSE,
                            includeEffort        = FALSE,
                            timeZone             = "Asia/Kuala_Lumpur"
)

DetHist1                     # this is a list with 1 element
DetHist1$detection_history   # this is the contained detection/non-detection matrix


# with effort
DetHist2 <- detectionHistory(recordTable          = recordTableSample,
                             camOp                = camop_no_problem,
                             stationCol           = "Station",
                             speciesCol           = "Species",
                             recordDateTimeCol    = "DateTimeOriginal",
                             species              = "VTA",
                             occasionLength       = 7,
                             day1                 = "station",
                             datesAsOccasionNames = FALSE,
                             includeEffort        = TRUE,
                             scaleEffort          = FALSE,
                             timeZone             = "Asia/Kuala_Lumpur"
)

DetHist2$detection_history  # detection history  (alternatively, use: DetHist2[[1]])
DetHist2$effort             # effort (alternatively, use: DetHist2[[2]])




