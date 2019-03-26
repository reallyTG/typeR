library(synoptReg)


### Name: tidy_cuttime_nc
### Title: Format a 3D-array to a S-mode data frame and set the time period
### Aliases: tidy_cuttime_nc

### ** Examples

# Load data (mslp or precp_grid)
data(mslp)
# Converting our data into a S-mode, but without modifying time period
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = TRUE)
# matrix conversion and setting time period for winters between 2001 and 2010
smode_mslp <- tidy_cuttime_nc(mslp, only_convert = FALSE, season = "winter",
                             initial_year = 2001, end_year = 2010)




