library(umx)


### Name: umxGxE_window
### Title: Implement the moving-window form of GxE analysis.
### Aliases: umxGxE_window

### ** Examples

library(umx);
# ==============================
# = 1. Open and clean the data =
# ==============================
# umxGxE_window takes a dataframe consisting of a moderator and two DV columns: one for each twin.
# The model assumes two groups (MZ and DZ). Moderator can't be missing
mod = "age" # The name of the moderator column in the dataset
selDVs = c("bmi1", "bmi2") # The DV for twin 1 and twin 2
data(twinData) # Dataset of Australian twins, built into OpenMx
# The twinData consist of two cohorts: "younger" and "older".
# zygosity is a factor. levels =  MZFF, MZMM, DZFF, DZMM, DZOS.
# Delete missing moderator rows
twinData = twinData[!is.na(twinData[mod]), ]
mzData = subset(twinData, zygosity == "MZFF", c(selDVs, mod))
dzData = subset(twinData, zygosity == "DZFF", c(selDVs, mod))

# ========================
# = 2. Run the analyses! =
# ========================
# Run and plot for specified windows (in this case just 1927)
umxGxE_window(selDVs = selDVs, moderator = mod, mzData = mzData, dzData = dzData, 
		target = 40, plotWindow = TRUE)

## Not run: 
##D # Run with FIML (default) uses all information
##D umxGxE_window(selDVs = selDVs, moderator = mod, mzData = mzData, dzData = dzData);
##D 
##D # Run creating weighted covariance matrices (excludes missing data)
##D umxGxE_window(selDVs = selDVs, moderator = mod, mzData = mzData, dzData = dzData, 
##D 		weightCov = TRUE); 
## End(Not run)




