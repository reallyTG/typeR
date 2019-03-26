library(phreeqc)


### Name: phrRunAccumulated
### Title: Runs the accumulated input.
### Aliases: phrRunAccumulated

### ** Examples


# turn on the output file
phrSetOutputFileOn(TRUE)

# load the phreeqc.dat database
phrLoadDatabaseString(phreeqc.dat)

# accumulate the input
phrAccumulateLine("TITLE Example 2.--Temperature dependence of solubility")
phrAccumulateLine("                  of gypsum and anhydrite")
phrAccumulateLine("SOLUTION 1 Pure water")
phrAccumulateLine("        pH      7.0")
phrAccumulateLine("        temp    25.0")
phrAccumulateLine("EQUILIBRIUM_PHASES 1")
phrAccumulateLine("        Gypsum          0.0     1.0")
phrAccumulateLine("        Anhydrite       0.0     1.0")
phrAccumulateLine("REACTION_TEMPERATURE 1")
phrAccumulateLine("        25.0 75.0 in 51 steps")
phrAccumulateLine("SELECTED_OUTPUT")
phrAccumulateLine("        -file   ex2.sel")
phrAccumulateLine("        -temperature")
phrAccumulateLine("        -si     anhydrite  gypsum")
phrAccumulateLine("END")

# run it and echo the name of the output file
if (is.null(phrRunAccumulated())) {
  cat(paste("see ", phrGetOutputFileName(), ".\n", sep = ""))
}



