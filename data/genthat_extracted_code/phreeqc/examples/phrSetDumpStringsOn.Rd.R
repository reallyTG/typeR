library(phreeqc)


### Name: phrSetDumpStringsOn
### Title: Set dump strings on/off.
### Aliases: phrSetDumpStringsOn

### ** Examples


# This example equilibrates pure water with calcite and echos the 
# dump strings.
phrLoadDatabaseString(phreeqc.dat)
phrSetDumpStringsOn(TRUE)
input <- c( 
  'SOLUTION 1 Pure water     ',
  'EQUILIBRIUM_PHASES 1      ',
  '    Calcite 0 10          ',
  'SAVE solution 1           ',
  'SAVE equilibrium_phases 1 ',
  'DUMP                      ',
  '    -solution 1           ',
  '    -equilibrium_phases 1 '
  )

if (is.null(phrRunString(input))) {
  cat("Dump:\n")
  cat(phrGetDumpStrings(), sep = "\n")
}




