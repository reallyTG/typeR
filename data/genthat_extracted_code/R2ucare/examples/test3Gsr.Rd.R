library(R2ucare)


### Name: test3Gsr
### Title: Test3G.SR
### Aliases: test3Gsr
### Keywords: package

### ** Examples

# Read in Geese dataset:
geese = system.file("extdata", "geese.inp", package = "R2ucare")
geese = read_inp(geese)

# Get encounter histories and number of individuals with corresponding histories
geese.hist = geese$encounter_histories
geese.freq = geese$sample_size

# perform Test3.GSR
test3Gsr(geese.hist,geese.freq)



