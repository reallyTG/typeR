library(drLumi)


### Name: SSexpcons
### Title: Self-Starting Nls exponential constraint regression model
### Aliases: SSexpcons
### Keywords: datasets

### ** Examples

# Load data
data(ecdata)
data(mfidata)

# Select analyte FGF for plate 1
dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)$plate_1

cons <- scluminex("plate_1",sdf$standard, sdf$background,
            lfct="SSexp",
            bkg="constraint",
            fmfi="mfi",
            verbose=FALSE)

summary(cons)

# Comparison constraint vs no constraint (same returning value but estimate
# one parameter).
b <- 3
y0 <- 1
concentration <- 2
SSexp(concentration, b, y0)
SSexpcons(y0, concentration, b)



