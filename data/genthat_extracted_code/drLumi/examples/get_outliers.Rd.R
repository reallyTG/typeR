library(drLumi)


### Name: get_outliers
### Title: Extract outliers from a scluminex object
### Aliases: get_outliers

### ** Examples

# Load data and estimate models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

# Select data and fit models
sdf <- data_selection(dat, ecdata)[[1]]
igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
                      lfct=c("SSl4", "SSl5"),
                      bkg="ignore",
                      fmfi="mfi",
                      verbose=FALSE)

# Extract outliers > abs(2.5)
get_outliers(igmodels, out.limit=2.5)

# Extract outliers > abs(1.5)
get_outliers(igmodels, out.limit=1.5)

# Extract outliers > abs(1)
get_outliers(igmodels, out.limit=1)



