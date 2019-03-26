library(MSnbase)


### Name: readMSData
### Title: Imports mass-spectrometry raw data files as 'MSnExp' instances.
### Aliases: readMSData readMSData2

### ** Examples

file <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.name = TRUE,
            pattern = "mzXML$")
mem <- readMSData(file, mode = "inMemory")
mem
dsk <- readMSData(file, mode = "onDisk")
dsk



