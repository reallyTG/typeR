library(scbursts)


### Name: dwt.read
### Title: Read a .dwt file.
### Aliases: dwt.read

### ** Examples


infile <- system.file("extdata", "example1_tac.evt", package = "scbursts")
transitions <- evt.read(infile)
dwells <- evt.to_dwells(transitions)

dwt.write(dwells, file=file.path(tempdir(), "dwells.dwt"))

# Quit R, come back the next day
## Not run: 
##D dwells <- dwt.read("dwells.dwt")
## End(Not run)




