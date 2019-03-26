library(R2ucare)


### Name: marray
### Title: m-array: table of first recaptures
### Aliases: marray
### Keywords: package

### ** Examples

# read in the classical dipper dataset
dipper = system.file("extdata", "ed.inp", package = "R2ucare")
dipper = read_inp(dipper,group.df=data.frame(sex=c('Male','Female')))

# Get encounter histories, counts and groups:
dip.hist = dipper$encounter_histories
dip.freq = dipper$sample_size
dip.group = dipper$groups

# get female data
mask = (dip.group == 'Female')
dip.fem.hist = dip.hist[mask,]
dip.fem.freq = dip.freq[mask]

# get number of released individuals (R), 
# the m-array (m) and 
# the number of individuals never seen again (never)
marray(dip.fem.hist,dip.fem.freq)



