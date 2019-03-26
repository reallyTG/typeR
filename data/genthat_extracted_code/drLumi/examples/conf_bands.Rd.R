library(drLumi)


### Name: conf_bands
### Title: Confidence interval for a scluminex object
### Aliases: conf_bands

### ** Examples

# Load data and fit models
data(ecdata)
data(mfidata)

plate1 <- mfidata[mfidata$plate=="plate_1",]
datasets <- data_selection(plate1, ecfile = ecdata)

background <- datasets[[1]]$background
standard <- datasets[[1]]$standard
mod <- scluminex(plateid = "plate_1", standard = standard,
background = background, bkg = "ignore",lfct="SSl4",
fmfi = "mfi", verbose = FALSE)

# Confidence-prediction intervals for FGF analyte
conf_bands(mod, "FGF", xvalue = c(1,3,4), interval = "confidence")
conf_bands(mod, "FGF", xvalue = c(1,3,4), interval = "prediction")

# For all analytes the prediction interval
conf_bands(mod, xvalue = 0.5, interval = "prediction")



