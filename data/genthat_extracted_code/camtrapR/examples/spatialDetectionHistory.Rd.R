library(camtrapR)


### Name: spatialDetectionHistory
### Title: Generate a 'capthist' object for spatial capture-recapture
###   analyses from camera-trapping data
### Aliases: spatialDetectionHistory

### ** Examples


data(recordTableIndividualSample)
data(camtraps)

# create camera operation matrix (with problems/malfunction)
camop_problem <- cameraOperation(CTtable      = camtraps,
                                 stationCol   = "Station",
                                 setupCol     = "Setup_date",
                                 retrievalCol = "Retrieval_date",
                                 writecsv     = FALSE,
                                 hasProblems  = TRUE,
                                 dateFormat   = "%d/%m/%Y"
)

sdh <- spatialDetectionHistory(recordTableIndividual = recordTableIndividualSample,
                               species               = "LeopardCat",
                               camOp                 = camop_problem,
                               CTtable               = camtraps,
                               output                = "binary",
                               stationCol            = "Station",
                               speciesCol            = "Species",
                               Xcol                  = "utm_x",
                               Ycol                  = "utm_y",
                               individualCol         = "Individual",
                               recordDateTimeCol     = "DateTimeOriginal",
                               recordDateTimeFormat  = "%Y-%m-%d %H:%M:%S",
                               occasionLength        = 10,
                               day1                  = "survey",
                               includeEffort         = TRUE,
                               timeZone              = "Asia/Kuala_Lumpur"
  )

# missing space in species = "LeopardCat" was introduced by recordTableIndividual
# (because of CRAN package policies.
# In your data you can have spaces in your directory names)

  summary(sdh)
  plot(sdh, tracks = TRUE)



