library(emuR)


### Name: trapply
### Title: A method of the generic function by for objects of class
###   \'trackdata\'
### Aliases: trapply
### Keywords: methods

### ** Examples


# mean f0 one value per segment
m = trapply(vowlax.fund, mean, simplify=TRUE)
# mean F1 - F4
m = trapply(vowlax.fdat, apply, 2, mean, simplify=TRUE)
# make a logical vector of any segments that have an F1 value
# between their start time and end time greater than n Hz
pfun <- function(x, n=1000) any(x > n)
# greater than 1100 Hz
temp = trapply(vowlax.fdat[,1], pfun, 1100, simplify=TRUE)
# get the F2-range per segment
r = trapply(vowlax.fdat[,2], range)
# F2-range of 20th segment
r[[20]]
# DCT-smooth F2 with 10 coeffs
# get the first 4 DCT coefficients
f2.dct = trapply(vowlax.fdat[,2], dct, 3, simplify=TRUE)
# dct-smooth F2 with the first 5 DCT coeffs
f2sm = trapply(vowlax.fdat[,2], dct, 4, TRUE,  returntrack=TRUE)
# Make new F2 trackdata such that each segment has
# F2 divided by its F2 range
pfun <- function(x) x/(diff(abs(range(x))))
newf2 = trapply(vowlax.fdat[,2], pfun, returntrack=TRUE)




