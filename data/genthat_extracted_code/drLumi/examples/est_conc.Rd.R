library(drLumi)


### Name: est_conc
### Title: Estimates concentration given an scluminex object
### Aliases: est_conc

### ** Examples

# Load data and fit models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]
sdf <- data_selection(dat, ecdata)$plate_1

igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
            lfct="SSl4", bkg="ignore", fmfi="mfi", verbose=FALSE)

# Data to estimate concentration
concdf <- sdf$positive

# Dilution factor 1
est_conc(igmodels, concdf, fmfi="mfi", dilution = 1)

# Dilution factor 2
est_conc(igmodels, concdf, fmfi="mfi", dilution = 2)



