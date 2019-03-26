## ----set-options, echo=FALSE, cache=FALSE-------------------------------------
options(width = 80)

## -----------------------------------------------------------------------------
library(HARtools)
har <- readHAR(system.file(package = "HARtools", 
                           "exdata", "google.com.har"))
har

## -----------------------------------------------------------------------------
names(har)
names(har[["log"]])

## -----------------------------------------------------------------------------
harData <- "http://www.janodvarko.cz/har/viewer/examples/google.com.har"
harURL <- readHAR(harData)
identical(harURL, har)

## -----------------------------------------------------------------------------
fileName <- system.file(package = "HARtools", "exdata", "google.com.har")
harString <- readChar(fileName, file.info(fileName)$size)
print(substr(harString, 1, 5*80))
harSTR <- readHAR(harString)
identical(harSTR, har)


## -----------------------------------------------------------------------------
harL <- jsonlite::fromJSON(system.file(package = "HARtools",
                                          "exdata", "google.com.har"),
                              simplifyVector = FALSE)
harLIST <- readHAR(harL)
identical(harLIST, har)


## -----------------------------------------------------------------------------
harFile <- tempfile(fileext = ".har")
writeHAR(har, harFile)
har2 <- readHAR(harFile)
identical(har, har2)

## -----------------------------------------------------------------------------
har <- readHAR(system.file(package = "HARtools", "exdata",
                           "r-project.org.161028_W2_11MA.har"))
hv <- HARviewer(har, width="100%", height="100%")
# view in R
hv


## ---- eval=FALSE--------------------------------------------------------------
#  library(shiny)
#  if(interactive()){
#    library(HARtools)
#    har <- readHAR(system.file(package = "HARtools", "exdata",
#                               "r-project.org.161028_W2_11MA.har"))
#    hv <- HARviewer(har)
#  
#    app <- shinyApp(
#      ui = fluidPage(
#        HARviewerOutput("myHAR")
#      ),
#      server = function(input, output) {
#        output$myHAR <- renderHARviewer(hv)
#      }
#    )
#    runApp(app)
#  }

