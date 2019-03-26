library(COMBIA)


### Name: readFMCAValues
### Title: Read data from raw FMCA format and clean for outliers
### Aliases: readFMCAValues

### ** Examples

fl <- system.file("extdata","FluoOptima_384_2014-03-28test.txt", package="COMBIA")
wls <- list(c("A11:H11", "A12:H12","A1:H10",   "I11:P11", "I12:P12","I1:P10", 
        "A23:H23", "A24:H24","A13:H22",   "I23:P23", "I24:P24","I13:P22")
                        )
pltype <- "384"
keypos <- 2     
seleckey <- "65000"
barCode <- 7049
minThersholdForCVCal <- 0.1 
minThersholdForCV <- 0.3
xConc <- c(0.00,  0.20,  0.39,0.78,  1.56,  3.12,  6.25, 12.50, 25.00, 50.00) 
yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
readFMCAValues(fl, pltype, keypos, seleckey, barCode,
              wls, minThersholdForCVCal, minThersholdForCV, xConc, yConc   )



