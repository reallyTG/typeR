library(drLumi)


### Name: loq_derivatives
### Title: Limits of quantifications estimation using derivatives
### Aliases: loq_derivatives

### ** Examples

# Load data and estimate models
data(ecdata)
data(mfidata)

dat <- mfidata[mfidata$plate=="plate_1" & mfidata$analyte=="FGF",]

sdf <- data_selection(dat, ecdata)[[1]]

igmodels <- scluminex("plate_1",sdf$standard, sdf$background,
                lfct=c("SSl4", "SSl5"),
                bkg="ignore",
                fmfi="mfi",
                verbose=FALSE)

loq_derivatives(igmodels)



