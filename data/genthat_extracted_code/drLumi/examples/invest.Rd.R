library(drLumi)


### Name: invest
### Title: Estimate the concentration given a response value
### Aliases: invest

### ** Examples

# Load data
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

# Estimate models
sdf <- data_selection(dat, ecdata)[[1]]
igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
lfct="SSl4", bkg="ignore", fmfi="mfi", verbose=FALSE)

# Delta
invest(igmodels, "FGF", c(2, 2.5, 3),  "delta")

# Bootstrap
invest(igmodels, "FGF" ,c(2, 2.5, 3), "bootstrap", nboot=10)



