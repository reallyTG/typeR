library(drLumi)


### Name: summary.scluminex
### Title: Summary of a scluminex object
### Aliases: summary.scluminex

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
summary(igmodels)



