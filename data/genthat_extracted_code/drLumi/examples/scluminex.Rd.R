library(drLumi)


### Name: scluminex
### Title: Estimates different models for each analyte.
### Aliases: scluminex

### ** Examples

# Load data
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)$plate_1

# Fit model and summary object
igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
                lfct=c("SSl4", "SSl5"),
                bkg="ignore",
                fmfi="mfi",
                verbose=FALSE)
ss <- summary(igmodels)

# Information
names(igmodels)
names(igmodels$FGF)

# Summary data
ss
as.data.frame(ss)
as.data.frame(igmodels)

# Plot the standard curve
plot(igmodels,"sc")



