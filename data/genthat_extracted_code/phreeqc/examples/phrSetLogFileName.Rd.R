library(phreeqc)


### Name: phrSetLogFileName
### Title: Set the name of the log file.
### Aliases: phrSetLogFileName

### ** Examples


# This example equilibrates pure water with calcite and displays
# the log file name.
phrLoadDatabaseString(phreeqc.dat)
phrSetLogFileOn(TRUE)
phrSetLogFileName("phreeqc.log")
input <- c( 
  'SOLUTION 1 Pure water ',
  'EQUILIBRIUM_PHASES 1  ',
  '    Calcite 0 10      ',
  'KNOBS                 ',
  '    -logfile true     '
  )

if (is.null(phrRunString(input))) {
  cat("see", phrGetLogFileName(), "\n")
}




