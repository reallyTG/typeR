library(drLumi)


### Name: SSl4cons
### Title: Self-Starting Nls 4 parameters logistic constraint regression
###   model
### Aliases: SSl4cons
### Keywords: datasets

### ** Examples

# Load data
data(ecdata)
data(mfidata)

# Select analyte FGF for plate 1
dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)[[1]]

cons <- scluminex("plate_1",sdf$standard, sdf$background,
           lfct="SSl4",
           bkg="constraint",
           fmfi="mfi",
           verbose=FALSE)

summary(cons)

# Comparison constraint vs no constraint (same returning value but
# estimate 3 parameters).
lAsym <- 1
Slope <- 2
hAsym   <- 2
xMid <- 3
concentration <- 2
SSl4(concentration, Slope, lAsym, hAsym, xMid)
SSl4cons(lAsym, concentration, Slope, hAsym, xMid)



