library(qpcR)


### Name: meltcurve
### Title: Melting curve analysis with (iterative) Tm identification and
###   peak area calculation/cutoff
### Aliases: meltcurve
### Keywords: models nonlinear

### ** Examples

## Default columns.
data(dyemelt)
res1 <- meltcurve(dyemelt, window = c(75, 86))
res1

## Selected columns and normalized fluo values.
res2 <- meltcurve(dyemelt, temps = c(1, 3), fluos = c(2, 4), 
                  window = c(75, 86), norm = TRUE)  

## Removing peaks based on peak area
## => two peaks have smaller areas and are not included.
res3 <- meltcurve(dyemelt, temps = 1, fluos = 2, window = c(75, 86),  
                  cut.Area = 0.2) 
attr(res3[[1]], "quality")
                 
## If all peak areas do not meet the cutoff value, meltcurve is
## flagged as 'bad'.
res4 <- meltcurve(dyemelt, temps = 1, fluos = 2, window = c(75, 86),  
                  cut.Area = 0.5) 
attr(res4[[1]], "quality")

## Optimizing span and peaks values.
## Not run: 
##D res5 <- meltcurve(dyemelt[, 1:6], window = c(74, 88), 
##D                   Tm.opt = c(77.2, 80.1, 82.4, 84.8))
## End(Not run)



