library(scbursts)


### Name: dwt.write
### Title: Write a dwt file to disk. Writes DOS line endings. Dwells are in
###   milliseconds
### Aliases: dwt.write

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)

dwt.write(dwells, file=file.path(tempdir(), "dwells.dwt"))




