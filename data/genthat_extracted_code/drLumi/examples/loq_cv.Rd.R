library(drLumi)


### Name: loq_cv
### Title: Limits of quantifications estimation using coefficient of
###   variation
### Aliases: loq_cv

### ** Examples

# Load data and estimate models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)$plate_1

igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
lfct=c("SSl4", "SSl5"), bkg="ignore", fmfi="mfi", verbose=FALSE)

loq_cv(igmodels, max.cv=0.25, n.cuts=100)



