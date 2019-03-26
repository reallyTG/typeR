library(drLumi)


### Name: SSl4
### Title: Self-Starting Nls 4 parameters logistic regression model
### Aliases: SSl4
### Keywords: datasets

### ** Examples

# Load data
data(ecdata)
data(mfidata)

# Select analyte FGF for plate 1
dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)[[1]]

ig <- scluminex("plate_1",sdf$standard, sdf$background,
           lfct="SSl4",
           bkg="ignore",
           fmfi="mfi",
           verbose=FALSE)

summary(ig)



