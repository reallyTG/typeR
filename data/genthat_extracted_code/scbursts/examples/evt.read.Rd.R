library(scbursts)


### Name: evt.read
### Title: Read a .evt file to a table. Times are in seconds
### Aliases: evt.read

### ** Examples


# import some of the data included with the package
infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)

head(transitions[[1]])




