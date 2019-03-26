library(drLumi)


### Name: plot.scluminex
### Title: Plot method for the scluminex class
### Aliases: plot.scluminex

### ** Examples

# Load data and estimate models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)[[1]]
sdf_luminex <- scluminex("plate_1",sdf$standard, sdf$background,
"SSl4", bkg="ignore", fmfi="mfi", verbose=FALSE)

# Plot standard curves
plot(sdf_luminex, "sc")

# Plots residuals
plot(sdf_luminex, "res")

# Plot QQplot
plot(sdf_luminex, "qq")



