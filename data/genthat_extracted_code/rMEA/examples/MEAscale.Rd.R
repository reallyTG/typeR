library(rMEA)


### Name: MEAscale
### Title: Scaling (and centering) of motion energy time-series
### Aliases: MEAscale

### ** Examples

## read the first 4 minutes of the normal sample
##   (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_raw <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)

## rescale with standard deviation
mea_scaled = MEAscale(mea_raw, scale = "sd")

## rescale by factor 0.7
mea_scaled = MEAscale(mea_raw, scale = 0.7)

## rescale s1
mea_scaled = MEAscale(mea_raw, scale = "sd")

## assign groups names
mea_raw <- setGroup(mea_raw, "raw")
mea_scaled <- setGroup(mea_scaled, "scaled")

## Compute ccf
mea_raw <- MEAccf(mea_raw, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = FALSE)
mea_scaled <- MEAccf(mea_scaled, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = FALSE)

## Compare the effect of scaling on ccf
MEAlagplot(mea_scaled, contrast = mea_raw)




