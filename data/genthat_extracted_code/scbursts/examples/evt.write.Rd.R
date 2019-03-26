library(scbursts)


### Name: evt.write
### Title: Write bursts to a .evt file.
### Aliases: evt.write

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")

# Get Dwells
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
dwells_c <- risetime.correct_gaussian(Tr=35.0052278, dwells, units="us")

# Get Header
header <- evt.extract_header(infile)

evt.write(dwells_c, header=header, file=file.path(tempdir(), "fixed_example1_tac.evt"))



