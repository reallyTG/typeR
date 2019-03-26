library(drLumi)


### Name: loq_interval
### Title: Limits of quantifications estimation using interval method
### Aliases: loq_interval

### ** Examples

# Load data and estimate models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)$plate_1

igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
                lfct="SSl4",
                bkg="ignore",
                fmfi="mfi",
                verbose=FALSE)

# All default arguments
loq_interval(igmodels)

# Low asymptote coefficient of the model is 2
loq_interval(igmodels, low.asymp = 2)

# Low asymptote coefficient of the model is 2 and high is 3
loq_interval(igmodels, low.asymp = 2, high.asymp = 3)

# Fix to 2 and 3 the lower and upper asymptote
loq_interval(igmodels, lowci=2, highci=3)



