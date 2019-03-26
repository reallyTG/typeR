library(spc)


### Name: xshewhartrunsrules.arl
### Title: Compute ARLs of Shewhart control charts with and without runs
###   rules
### Aliases: xshewhartrunsrules.arl xshewhartrunsrules.crit
###   xshewhartrunsrules.ad xshewhartrunsrules.matrix
### Keywords: ts

### ** Examples

## Champ/Woodall (1987)
## Table 1
mus <- (0:15)/5
Mxshewhartrunsrules.arl <- Vectorize(xshewhartrunsrules.arl, "mu")
# standard (1 of 1 beyond 3 sigma) Shewhart chart without runs rules
C1 <- round(Mxshewhartrunsrules.arl(mus, type="1"), digits=2)
# standard + runs rule: 2 of 3 beyond 2 sigma on the same side
C12 <- round(Mxshewhartrunsrules.arl(mus, type="12"), digits=2)
# standard + runs rule: 4 of 5 beyond 1 sigma on the same side
C13 <- round(Mxshewhartrunsrules.arl(mus, type="13"), digits=2)
# standard + runs rule: 8 of 8 on the same side of the center line
C14 <- round(Mxshewhartrunsrules.arl(mus, type="14"), digits=2)

## original results are
#  mus     C1    C12    C13    C14                                    
#  0.0 370.40 225.44 166.05 152.73                                    
#  0.2 308.43 177.56 120.70 110.52                                    
#  0.4 200.08 104.46  63.88  59.76                                    
#  0.6 119.67  57.92  33.99  33.64                                    
#  0.8  71.55  33.12  19.78  21.07                                    
#  1.0  43.89  20.01  12.66  14.58                                    
#  1.2  27.82  12.81   8.84  10.90                                    
#  1.4  18.25   8.69   6.62   8.60                                    
#  1.6  12.38   6.21   5.24   7.03                                    
#  1.8   8.69   4.66   4.33   5.85                                    
#  2.0   6.30   3.65   3.68   4.89                                    
#  2.2   4.72   2.96   3.18   4.08                                    
#  2.4   3.65   2.48   2.78   3.38                                    
#  2.6   2.90   2.13   2.43   2.81                                    
#  2.8   2.38   1.87   2.14   2.35                                    
#  3.0   2.00   1.68   1.89   1.99

data.frame(mus, C1, C12, C13, C14)

## plus calibration, i. e. L0=250 (the maximal value for "14" is 255!
L0 <- 250
c1  <- xshewhartrunsrules.crit(L0, type = "1")
c12 <- xshewhartrunsrules.crit(L0, type = "12")
c13 <- xshewhartrunsrules.crit(L0, type = "13")
c14 <- xshewhartrunsrules.crit(L0, type = "14")
C1  <- round(Mxshewhartrunsrules.arl(mus, c=c1,  type="1"), digits=2)
C12 <- round(Mxshewhartrunsrules.arl(mus, c=c12, type="12"), digits=2)
C13 <- round(Mxshewhartrunsrules.arl(mus, c=c13, type="13"), digits=2)
C14 <- round(Mxshewhartrunsrules.arl(mus, c=c14, type="14"), digits=2)
data.frame(mus, C1, C12, C13, C14)

## and the steady-state ARL
Mxshewhartrunsrules.ad <- Vectorize(xshewhartrunsrules.ad, "mu1")
C1  <- round(Mxshewhartrunsrules.ad(mus, c=c1,  type="1"), digits=2)
C12 <- round(Mxshewhartrunsrules.ad(mus, c=c12, type="12"), digits=2)
C13 <- round(Mxshewhartrunsrules.ad(mus, c=c13, type="13"), digits=2)
C14 <- round(Mxshewhartrunsrules.ad(mus, c=c14, type="14"), digits=2)
data.frame(mus, C1, C12, C13, C14)



