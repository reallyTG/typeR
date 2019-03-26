library(drLumi)


### Name: SSexp
### Title: Self-Starting Nls exponential regression model
### Aliases: SSexp
### Keywords: datasets

### ** Examples

# Load data
data(ecdata)
data(mfidata)

# Select analyte FGF for plate 1
dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)$plate_1

ig <- scluminex("plate_1",sdf$standard, sdf$background,
            lfct="SSexp",
            bkg="ignore",
            fmfi="mfi",
            verbose=FALSE)

summary(ig)



