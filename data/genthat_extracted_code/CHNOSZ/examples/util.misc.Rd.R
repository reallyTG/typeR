library(CHNOSZ)


### Name: util.misc
### Title: Functions for Miscellaneous Tasks
### Aliases: util.misc dPdTtr Ttr GHS_Tr unitize

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## properties of phase transitions
si <- info("enstatite")
# (dP/dT) of transitions
dPdTtr(si)  # first transition
dPdTtr(si+1) # second transition
# temperature of transitions (Ttr) as a function of P
Ttr(si,P=c(1,10,100,1000))
Ttr(si,P=c(1,10,100,1000))

# calculate the GHS at Tr for the high-temperature phases of iron
# using transition enthalpies from the SUPCRT92 database (sprons92.dat)
Htr <- c(326.0, 215.0, 165.0)
iiron <- info("iron")
GHS_Tr(iiron, Htr)
# the results calculated above are stored in the database ...
info(1:3 + iiron)[, c("G", "H", "S")]
# ... meaning that we can recalculate the transition enthalpies using subcrt()
sapply(info(0:2 + iiron)$T, function(T) {
  # a very small T increment around the transition temperature
  T <- convert(c(T-0.01, T), "C")
  # use suppressMessages to make the output less crowded
  substuff <- suppressMessages(subcrt("iron", T=T, P=1))
  diff(substuff$out$iron$H)
})

## scale logarithms of activity
# suppose we have two proteins whose lengths are 100 and 
# 200; what are the logarithms of activity of the proteins 
# that are equal to each other and that give a total 
# activity of residues equal to unity?
logact <- c(-3,-3)  # could be any two equal numbers
length <- c(100,200)
logact.tot <- 0
loga <- unitize(logact,length,logact.tot)
# the proteins have equal activity
stopifnot(identical(loga[1],loga[2]))
# the sum of activity of the residues is unity
stopifnot(isTRUE(all.equal(sum(10^loga * length),1)))
## now, what if the activity of protein 2 is ten
## times that of protein 1?
logact <- c(-3,-2)
loga <- unitize(logact,length,logact.tot)
# the proteins have unequal activity
stopifnot(isTRUE(all.equal(loga[2]-loga[1],1)))
# but the activities of residues still add up to one
stopifnot(isTRUE(all.equal(sum(10^loga * length),1)))



