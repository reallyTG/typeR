library(R.utils)


### Name: queryRCmdCheck
### Title: Gets the on R CMD check if the current R session was launched by
###   it
### Aliases: queryRCmdCheck

### ** Examples


status <- queryRCmdCheck()
if (status != "notRunning") {
  cat("The current R session was launched by R CMD check. Status: ", status, "\n")
} else {
  cat("The current R session was not launched by R CMD check.\n")
}

# Display how R was launched
print(base::commandArgs())

# Display loaded packages etc.
print(search())

# Display current working directory
print(getwd())



