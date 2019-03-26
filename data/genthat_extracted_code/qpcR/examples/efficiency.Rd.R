library(qpcR)


### Name: efficiency
### Title: Calculation of qPCR efficiency and other important qPCR
###   parameters
### Aliases: efficiency
### Keywords: models nonlinear

### ** Examples

## Fitting initial model.
m1 <-  pcrfit(reps, 1, 2, l4)
efficiency(m1)
 
## Using one cycle 'downstream'
## of second derivative max.
efficiency(m1, type = "cpD2", shift = -1)

## Using "maxE" method, with calculation of PCR efficiency
## 2 cycles 'upstream' from the cycle of max efficiency.
efficiency(m1, type = "maxE", shift = 2)

## Using the exponential region.
efficiency(m1, type = "expR")

## Using threshold cycle (i.e. 15.32) 
## from PCR software.
efficiency(m1, type = 15.32)

## Using Cy0 method from Guescini et al. (2008)
## add Cy0 tangent. 
efficiency(m1, type = "Cy0")
Cy0(m1, add = TRUE)

## Using a defined fluorescence
## threshold value from PCR software.
efficiency(m1, thresh = 1)
 
## Using the first 30 cycles and a template amount
## (optical calibration).
m2 <-  pcrfit(reps[1:30, ], 1, 2, l5)
efficiency(m2, amount = 1E3)

## Using 'maxRatio' method from Shain et al. (2008)
## baseshifting essential!
efficiency(m1, type = "maxRatio", baseshift = 0.2)

## Using the efficiency from a cubic spline fit
## of the 'eff' function.
efficiency(m1, method = "spline")

## Not run: 
##D ## On a modlist with plotting
##D ## of the efficiencies.
##D ml1 <- modlist(reps, model = l5)
##D res <- sapply(ml1, function(x) efficiency(x)$eff)
##D barplot(as.numeric(res))
## End(Not run)



