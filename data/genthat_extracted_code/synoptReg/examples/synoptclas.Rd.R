library(synoptReg)


### Name: synoptclas
### Title: Synoptic classification
### Aliases: synoptclas

### ** Examples

# Load data (mslp)
data(mslp)
# Converting our data into a S-mode, but without modifying time period
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = TRUE)
# classification performance
smode_clas <- synoptclas(smode_mslp$smode_data, ncomp = 6)





