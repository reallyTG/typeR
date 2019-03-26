library(phreeqc)


### Name: phrAccumulateLine
### Title: Accumulate line(s) for input to phreeqc.
### Aliases: phrAccumulateLine

### ** Examples


# this example loads the phreeqc.dat database, accumulates input, and
# runs it
phrLoadDatabaseString(phreeqc.dat)
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
phrSetOutputFileOn(TRUE)
if (is.null(phrRunAccumulated())) {
  cat(paste("see ", phrGetOutputFileName(), ".\n", sep = ""))
}




