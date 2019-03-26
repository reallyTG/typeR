library(phreeqc)


### Name: phrSetOutputStringsOn
### Title: Set output strings on/off.
### Aliases: phrSetOutputStringsOn

### ** Examples


# This example equilibrates pure water with calcite and displays
# the results.
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
input <- c( 
  'SOLUTION 1 Pure water ',
  'EQUILIBRIUM_PHASES 1  ',
  '    Calcite 0 10      '
  )

if (is.null(phrRunString(input))) {
  cat(phrGetOutputStrings(), sep = "\n")
}




