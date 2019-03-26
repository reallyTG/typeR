library(rMEA)


### Name: MEAlagplot
### Title: Plots the average cross-correlation at different lags
### Aliases: MEAlagplot

### ** Examples

## No test: 
## This example is excluded from test as it takes more than 10s to run
## read the first 4 minutes of the normal sample
##   (intake interviews of patients that carried on therapy)
path_normal <- system.file("extdata/normal", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)
mea_normal <- setGroup(mea_normal, "normal")

## read the dropout sample (intake interviews of patients that dropped out)
path_dropout <- system.file("extdata/dropout", package = "rMEA")
mea_dropout <- readMEA(path_dropout, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist",
                     idOrder = c("id","session"), idSep="_", skip=1, nrow = 6000)
mea_dropout <- setGroup(mea_dropout, "dropout")

## Combine into a single object
mea_all = c(mea_normal, mea_dropout)

## Create a shuffled sample
mea_rand = shuffle(mea_all, 20)

## Compute ccf
mea_all = MEAccf(mea_all, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = TRUE)
mea_rand = MEAccf(mea_rand, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = TRUE)

## Visualize the effects:

MEAlagplot(mea_all, contrast = mea_rand, by.group = TRUE)
## End(No test)



