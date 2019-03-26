library(mzID)


### Name: mzID
### Title: Parse an mzIdentML file
### Aliases: mzID

### ** Examples


# Parsing of the example files provided by HUPO:
exampleFiles <- list.files(system.file('extdata', package = 'mzID'), 
                           pattern = '*.mzid', full.names = TRUE)
mzID(exampleFiles[1])

mzID(exampleFiles[2])

mzID(exampleFiles[3])

mzID(exampleFiles[4])

mzID(exampleFiles[5])

mzID(exampleFiles[6])

mzID(exampleFiles[7])

mzID(exampleFiles[8])

mzID(exampleFiles[9])

# Parsing into an mzIDCollection
collection <- mzID(exampleFiles[1:3])
names(collection)




