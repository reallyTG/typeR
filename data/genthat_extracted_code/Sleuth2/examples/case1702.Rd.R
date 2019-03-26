library(Sleuth2)


### Name: case1702
### Title: Love and Marriage
### Aliases: case1702
### Keywords: datasets

### ** Examples

str(case1702)

# feelings about spouse
tospouse <- with(case1702, cbind(Hps, Wps, Hcs, Wcs))
# perceived feelings from spouse
fromspouse <- with(case1702, cbind(Hpy, Wpy, Hcy, Wcy))
cca <- cancor(tospouse,fromspouse)
# Examine loadings of first canonical variables:
par(mfrow=c(2,1))
barplot(cca$xcoef[,1], ylab="first 'to spouse' loadings", 
     names=c("Hps","Wps","Hcs","Wcs")) 
barplot(cca$ycoef[,1], ylab="first 'from spouse' loadings", 
     names=c("Hpy","Wpy","Hcy","Wcy")) 

# The first canonical variable for 'to spouse" is mostly Hcs
# The first canonical variable for 'fom spouse' is mostly Hcy

can.to <- tospouse 
can.from <- fromspouse 
can.to.1 <- can.to[,1] # first canonical variable
can.from.1 <- can.from[,1] # first canonical variable
pairs(cbind(can.to.1, case1702$Hcs, can.from.1, case1702$Hcy),
	labels=c("1st cv 'to'","husband's compassionate","1st cv
        'from'","husband's perceived compassionate")) 



