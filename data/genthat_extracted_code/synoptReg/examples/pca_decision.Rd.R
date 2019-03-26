library(synoptReg)


### Name: pca_decision
### Title: PCA decision
### Aliases: pca_decision

### ** Examples

# Load data (mslp)
data(mslp)
# Converting our data into a S-mode, but without modifying time period
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = TRUE)
# PCA decision performance
info_pca <- pca_decision(smode_mslp$smode_data)




