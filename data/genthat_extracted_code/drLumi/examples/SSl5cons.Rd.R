library(drLumi)


### Name: SSl5cons
### Title: Self-Starting Nls 5 parameters logistic constraint regression
###   model
### Aliases: SSl5cons
### Keywords: datasets

### ** Examples

# Load data
data(ecdata)
data(mfidata)

# Select analyte FGF for plate 1
dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)[[1]]

# SSl5
cons <- scluminex("plate_1",sdf$standard, sdf$background,
            lfct="SSl5",
            bkg="constraint",
            fmfi="mfi",
            verbose=FALSE)

summary(cons)

# Comparison constraint vs no constraint (same returning value but estimate
# 4 parameters).
lAsym <- 1
Slope <- 2
hAsym   <- 2
xMid <- 3
Asymetry <- 1.5

concentration <- 2
SSl5(concentration, Slope, lAsym, hAsym, xMid, Asymetry)
SSl5cons(lAsym, concentration, Slope, hAsym, xMid, Asymetry)



