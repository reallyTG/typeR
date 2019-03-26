library(rMEA)


### Name: MEAsmooth
### Title: Moving average smoothing for motion energy data
### Aliases: MEAsmooth

### ** Examples

## read the first 4 minutes of the normal sample
##   (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_raw <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)

## filter with moving average
mea_filter = MEAsmooth(mea_raw)

## assign groups names
mea_raw <- setGroup(mea_raw, "raw")
mea_filter <- setGroup(mea_filter, "filtered")

## Compute ccf
mea_raw <- MEAccf(mea_raw, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = FALSE)
mea_filter <- MEAccf(mea_filter, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = FALSE)

## Compare the effect of filtering on ccf
MEAlagplot(mea_filter, contrast = mea_raw)




