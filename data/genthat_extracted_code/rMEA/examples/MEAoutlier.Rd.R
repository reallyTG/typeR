library(rMEA)


### Name: MEAoutlier
### Title: Replace outliers with given values
### Aliases: MEAoutlier

### ** Examples

## read the first 4 minutes of the normal sample
##   (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_raw <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)

## Remove extreme values, higher than 10 times the standard deviation
mea_clean = MEAoutlier(mea_raw, threshold=function(x){sd(x)*10}, direction = "greater")



