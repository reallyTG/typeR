library(adehabitatHS)


### Name: wi
### Title: Computation of Selection Ratios for Habitat Selection Studies.
### Aliases: widesI widesII widesIII print.wiI print.wiII print.wiIII
###   plot.wi wi wiI wiII wiIII
### Keywords: hplot math

### ** Examples


############################
## Example of moose (Manly et al., 2003, p.52)
## Known available proportions on design I data
moose.avail <- c(0.34, 0.101, 0.104, 0.455)
moose.used <- c(25, 22, 30, 40)
names(moose.used) <- c("InBurnInterior",
                     "InBurnEdge",
                     "OutOfBurnEdge",
                     "OutOfBurnFurther")
names(moose.avail) <- names(moose.used)
## Computation of wi
(wiRatio <- widesI(moose.used, moose.avail))

## plot the values of the selection ratios
opar <- par(mfrow=c(2,2))
plot(wiRatio)

par(opar)




############################
## Example of Elk (Manly et al., 2003, p.62)
## Estimated available proportions on design I data
elk.avail <- c(15, 61, 84, 40)
elk.used <- c(3, 90, 181, 51)
names(elk.used) <- c("0%", "1-25%", "26-75%", ">75%")
names(elk.avail) <- names(elk.used)
## Computation of wi
(wiRatio <- widesI(elk.used, elk.avail, avknown=FALSE))

## plot the values of the selection ratios
opar <- par(mfrow=c(2,2))
plot(wiRatio)

par(opar)




############################
## Example of Bighorn (Manly et al., 2003, p.67)
## Known available proportions on design II data
data(bighorn)
## Computation of wi
(wi <- widesII(bighorn$used, bighorn$availT, alpha = 0.1))

## plot the values of the selection ratios
opar <- par(mfrow=c(2,2))
plot(wi)



############################
## Example of Bighorn (Manly et al., 2003, p.74)
## Estimated available proportions on design II data
## Computation of wi
(wi <- widesII(bighorn$used, bighorn$availE, avknown = FALSE, alpha = 0.1))

## plot the values of the selection ratios
plot(wi)

par(opar)


############################
## Example of Wild boar
## Estimated available proportions on design III data
data(puechdesIII)
used <- puechdesIII$used
available <- puechdesIII$available

## calculation of the selectio ratios
## with sampled availability
(i <- widesIII(used,available, avknown = FALSE, alpha = 0.1))

opar <- par(mfrow = c(2,2))
plot(i)

par(opar)





