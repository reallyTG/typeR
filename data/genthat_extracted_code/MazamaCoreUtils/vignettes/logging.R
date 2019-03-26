## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loggingExample------------------------------------------------------
library(MazamaCoreUtils)

# Set up logging 
tmpDir <- tempdir()
logger.setup(
  errorLog = file.path(tmpDir,"ERROR.log"),
  infoLog = file.path(tmpDir,"INFO.log"),
  traceLog = file.path(tmpDir,"TRACE.log")
)

# Begin main program
logger.info("Begin loggingExample ...")

# Try something that might fail
outputSums <- list()
for ( column in names(iris) ) {
  
  logger.trace("Working on: %s", column)
  
  result <- try({
    outputSums[[column]] <- 
      paste0("Sum of ", column, " = ", sum(iris[[column]]))
  }, silent = FALSE)
  
  if ( "try-error" %in% class(result) ) {
    logger.warn("Oops: %s", geterrmessage())
  }
  
}

# Successful completion
logger.error("NO ERRORS")
logger.info("Successfully completed loggingExample")
logger.info("\n=============== THE END ===============\n")

# Check the output
str(outputSums)

## ----errorLog, echo = FALSE----------------------------------------------
cat(paste(readLines(file.path(tmpDir,"ERROR.log")),collapse='\n'))

## ----infoLog, echo = FALSE-----------------------------------------------
cat(paste(readLines(file.path(tmpDir,"INFO.log")),collapse='\n'))

## ----traceLog, echo = FALSE----------------------------------------------
cat(paste(readLines(file.path(tmpDir,"TRACE.log")),collapse='\n'))

