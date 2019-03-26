library(phreeqc)


### Name: phrSetOutputFileName
### Title: Set the name of the output file.
### Aliases: phrSetOutputFileName

### ** Examples


# This example equilibrates pure water with calcite and displays
# the resulting file name.
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputFileOn(TRUE)
phrSetOutputFileName("phreeqc.output")
input <- c( 
  'SOLUTION 1 Pure water ',
  'EQUILIBRIUM_PHASES 1  ',
  '    Calcite 0 10      '
  )

if (is.null(phrRunString(input))) {
  cat("see", phrGetOutputFileName(), "\n")
}




