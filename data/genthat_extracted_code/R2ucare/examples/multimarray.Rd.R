library(R2ucare)


### Name: multimarray
### Title: Multistate m-array
### Aliases: multimarray
### Keywords: package

### ** Examples

# Read in Geese dataset:
geese = system.file("extdata", "geese.inp", package = "R2ucare")
geese = read_inp(geese)

# Get encounter histories and number of individuals with corresponding histories
geese.hist = geese$encounter_histories
geese.freq = geese$sample_size

# build m-array
multimarray(geese.hist, geese.freq)



