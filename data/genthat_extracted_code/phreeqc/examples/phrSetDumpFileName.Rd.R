library(phreeqc)


### Name: phrSetDumpFileName
### Title: Set the name of the dump file.
### Aliases: phrSetDumpFileName

### ** Examples


# This example equilibrates pure water with calcite and writes the 
# dump results to file.
phrLoadDatabaseString(phreeqc.dat)
phrSetDumpFileOn(TRUE)
phrSetDumpFileName("phreeqc.dump")
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
  cat("see", phrGetDumpFileName(), "\n")
}




