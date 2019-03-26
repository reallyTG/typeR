library(phreeqc)


### Name: phrGetDumpFileName
### Title: Retrieve the name of the dump file.
### Aliases: phrGetDumpFileName

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetDumpFileOn(TRUE)

input <-              "SOLUTION 1 Pure water     \n"
input <- paste(input, "EQUILIBRIUM_PHASES 1      \n")
input <- paste(input, "    Calcite 0 10          \n")
input <- paste(input, "SAVE solution 1           \n")
input <- paste(input, "SAVE equilibrium_phases 1 \n")
input <- paste(input, "DUMP                      \n")
input <- paste(input, "    -solution 1           \n")
input <- paste(input, "    -equilibrium_phases  1\n")

if (!is.null(phrRunString(input))) {
  cat(phrGetErrorStrings())
}
cat(paste("see ", phrGetDumpFileName(), "."))





