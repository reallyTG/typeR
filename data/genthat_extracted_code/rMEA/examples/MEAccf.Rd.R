library(rMEA)


### Name: MEAccf
### Title: Moving-windows lagged cross-correlation routine for 'MEA'
###   objects
### Aliases: MEAccf

### ** Examples

## read a single file
path_normal <- system.file("extdata/normal/200_01.txt", package = "rMEA")
mea_normal <- readMEA(path_normal, sampRate = 25, s1Col = 1, s2Col = 2,
                     s1Name = "Patient", s2Name = "Therapist", skip=1,
                     idOrder = c("id","session"), idSep="_")

## perform ccf analysis
mea_ccf = MEAccf(mea_normal, lagSec = 5, winSec = 60, incSec = 30, r2Z = TRUE, ABS = TRUE)
summary(mea_ccf)

#visualize the analysis results for the first file
MEAheatmap(mea_ccf[[1]])




