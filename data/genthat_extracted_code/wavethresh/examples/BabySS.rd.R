library(wavethresh)


### Name: BabySS
### Title: Physiological data time series.
### Aliases: BabySS
### Keywords: datasets

### ** Examples

data(BabyECG)
data(BabySS)
#

# Plot the BabyECG data with BabySS overlaid

#

# Note the following code does some clever scaling to get the two

# time series overlaid.

#

myhrs <- c(22, 23, 24, 25, 26, 27, 28, 29, 30)

mylab <- c("22", "23", "00", "01", "02", "03", "04", "05", "06")

initsecs <- 59 + 60 * (17 + 60 * 21)

mysecs <- (myhrs * 3600)

secsat <- (mysecs - initsecs)/16

mxy <- max(BabyECG)

mny <- min(BabyECG)

ro <- range(BabySS)

no <- ((mxy - mny) * (BabySS - ro[1]))/(ro[2] - ro[1]) + mny

rc <- 0:4

nc <- ((mxy - mny) * (rc - ro[1]))/(ro[2] - ro[1]) + mny

## Not run: 
##D plot(1:length(BabyECG), BabyECG, xaxt = "n", type = "l", xlab = 
##D 	"Time (hours)", ylab = "Heart rate (beats per minute)")
## End(Not run)

## Not run: lines(1:length(BabyECG), no, lty = 3)

## Not run: axis(1, at = secsat, labels = mylab)

## Not run: axis(4, at = nc, labels = as.character(rc))

#

# Sleep state is the right hand axis

#
#



