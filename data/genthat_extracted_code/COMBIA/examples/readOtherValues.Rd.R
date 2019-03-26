library(COMBIA)


### Name: readOtherValues
### Title: Read data from raw format and clean for outliers
### Aliases: readOtherValues

### ** Examples

fl <- system.file("extdata", "FluoOptima_384_2014-03-28test.csv", package="COMBIA")
wls <- list(  c(  "K1:K8", "L1:L8","A1:J8",     "K9:K16", "L9:L16","A9:J16", 
                  "W1:W8", "X1:X8","M1:V8",     "W9:W16", "X9:X16","M9:V16")
                  )
sh <- 1
rskip <- 0 
cStart <- 1
pltype <- "384"
minThersholdForCVCal <- 0.1
minThersholdForCV<- 0.3
survivalFunc <- function (x,y,z) {(x-z)/(y-z)}
xConc <- c(0.00,  0.20,  0.39,  0.78,  1.56,  3.12,  6.25, 12.50, 25.00, 50.00) 
yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
rslt <- readOtherValues(fl, sh, rskip, cStart, wls, pltype, minThersholdForCVCal, 
                minThersholdForCV, survivalFunc, xConc, yConc )



