library(MicroDatosEs)


### Name: test.metadata
### Title: Reads microdata using user provided metadata files
### Aliases: test.metadata
### Keywords: manip

### ** Examples

# This command reads a few lines sampled from 
# the EPA for 2011Q1
x <- test.metadata(system.file("extdata", "sampleEPA0111.txt", package = "MicroDatosEs"),
                   system.file("metadata", "epa_mdat1.txt", package = "MicroDatosEs"),
                   system.file("metadata", "epa_mdat2.txt", package = "MicroDatosEs"))



