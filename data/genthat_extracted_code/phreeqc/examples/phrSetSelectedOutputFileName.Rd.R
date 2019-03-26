library(phreeqc)


### Name: phrSetSelectedOutputFileName
### Title: Set the name of the selected_output file.
### Aliases: phrSetSelectedOutputFileName

### ** Examples


# This example equilibrates pure water with calcite at various temperatures
# and displays the name of the selected_output file.
phrLoadDatabaseString(phreeqc.dat)
phrSetSelectedOutputFileOn(1, TRUE)
phrSetSelectedOutputFileName(1, "ex2.sel")

input <- c( 
  'SOLUTION 1 Pure water     ',
  'EQUILIBRIUM_PHASES 1      ',
  '    Calcite    0.0   1.0  ',
  'REACTION_TEMPERATURE 1    ',
  '    25.0 75.0 in 51 steps ',
  'SELECTED_OUTPUT 1         ',
  '    -temperature          ',
  '    -si     calcite       '
  )


if (is.null(phrRunString(input))) {
  cat("see", phrGetSelectedOutputFileName(1))
}




