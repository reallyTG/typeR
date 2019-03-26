library(R2ucare)


### Name: test3Gsm
### Title: Test3G.SM
### Aliases: test3Gsm
### Keywords: package

### ** Examples

# Read in Geese dataset:
geese = system.file("extdata", "geese.inp", package = "R2ucare")
geese = read_inp(geese)

# Get encounter histories and number of individuals with corresponding histories
geese.hist = geese$encounter_histories
geese.freq = geese$sample_size

# perform Test.3.GSm
test3Gsm(geese.hist,geese.freq)



