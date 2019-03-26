library(scbursts)


### Name: evt.to_dwells
### Title: Calculate pulse lengths. Converts transition times to dwell
###   durations.
### Aliases: evt.to_dwells

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)
head(dwells[[1]])




