library(nonparaeff)


### Name: dea
### Title: Linear Programming for the Data Envelopment Analysis
### Aliases: dea
### Keywords: Data Envelopment Analysis

### ** Examples

## input-oriented DEA under the CRS assumption (1 input and 1 output)
tab3.1.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9), 
                         x = c(3, 2, 6, 4, 8, 8, 10))
(re <- dea(base = tab3.1.dat, noutput = 1, orientation = 1, rts = 1,
onlytheta = FALSE))

## input-oriented DEA under the CRS assumption (2 inputs and 1 output)
tab3.3.dat <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                              x1 = c(1, 3, 6, 2, 5, 9),
                              x2 = c(4, 1, 1, 8, 5, 2))
re <- dea(base=tab3.3.dat, noutput = 1, orientation = 1, rts = 1)
## finding references points
(ref <- data.frame(y = c(tab3.3.dat$y + re$slack.y1),
x1 = c(tab3.3.dat$x1 * re$eff - re$slack.x1),
x2 = c(tab3.3.dat$x2 * re$eff - re$slack.x2)))


## output-oriented DEA under the CRS assumption (1 input and 2 outputs)
tab5.1.dat <- data.frame(y1 = c(4, 8, 8, 4, 3, 1),
                         y2 = c(9, 6, 4, 3, 5, 6),
                         x = c(1, 1, 1, 1, 1, 1))
(re <- dea(tab5.1.dat, noutput = 2, orientation = 2, rts = 1))

## input-oriented DEA under the VRS assumption (1 input and 1 output)
tab6.1.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9),
                              x = c(3, 2, 6, 4, 8, 8, 10))
(re <- dea(tab6.1.dat, noutput = 1, orientation = 1, rts = 2))

## output-oriented DEA under the VRS assumtion (1 input and 1 output)
(re <- dea(tab6.1.dat, noutput = 1, orientation = 2, rts = 2))

## scale efficiency
re.crs <-
    dea(tab6.1.dat, noutput = 1, orientation = 1, rts = 1,onlytheta = TRUE)
re.vrs<-
    dea(tab6.1.dat, noutput = 1, orientation = 1, rts = 2,
         onlytheta = TRUE)
scale.eff <- re.crs/re.vrs

## finding DRS, IRS, CRS
dat6.1 <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9),
     x = c(3, 2, 6, 4, 8, 8, 10))
re <- dea(dat6.1, noutput = 1, rts = 1)
lambdas <- re[, 2:8]
apply(lambdas, 1, sum) 



