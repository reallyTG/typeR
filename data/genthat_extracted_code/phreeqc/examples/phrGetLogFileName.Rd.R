library(phreeqc)


### Name: phrGetLogFileName
### Title: Retrieve the name of the log file.
### Aliases: phrGetLogFileName

### ** Examples


# This example checks to see if the log file is turned on
# and prints the appropriate message
if (phrGetLogFileOn()) {
  cat("The name of the log file (is/will be):", phrGetLogFileName(), "\n")
} else {
  cat("The log file is not turned on\n")
}




