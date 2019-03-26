library(scbursts)


### Name: evt.from_dwells
### Title: Converts dwell durations to absolute transition times.
### Aliases: evt.from_dwells

### ** Examples


dwells_file <- system.file("extdata", "example1_qub.dwt", package = "scbursts")
dwells <- dwt.read(dwells_file)

transitions <- evt.from_dwells(dwells)




