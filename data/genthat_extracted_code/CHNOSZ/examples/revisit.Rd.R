library(CHNOSZ)


### Name: revisit
### Title: Plots and Optima of Objective Functions
### Aliases: revisit richness

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## example of defining a new objective function
# count the species with logarithms of activity greater than loga2
count <- function(loga1, loga2) rowSums(loga1 > loga2)
# set the attribute indicating the type of optimum
attr(count, "optimum") <- "maximal"
# equilibrate a system of amino acids
basis("CHNOS")
species(aminoacids(""))
a <- affinity(O2=c(-80, -60))
e <- equilibrate(a)
# make a plot
r <- revisit(e, "count", -5)
title(main="Amino acids with metastable log activities > -5")

# can also make a 2-D plot
a <- affinity(O2=c(-74, -60, 25), H2O=c(-3, 3, 25))
e <- equilibrate(a)
r <- revisit(e, "count", -5, style.2D="image", plot.optval=FALSE)
title(main="Amino acids with metastable log activities > -5")

## 'revisit' calculations for amino acids
opar <- par(mfrow=c(2, 2))
basis("CHNOS+")
species(aminoacids(""))
# chemical affinities as a function of logarithm of oxygen fugacity
a <- affinity(O2=c(-85, -60))
# shows the equilibrium abundances of the amino acids
e <- equilibrate(a)
diagram(e)
mtitle(c("20 amino acids", "balanced on CO2"))
# show a legend with input constraints
db <- describe.basis(ibasis=3)
dp <- describe.property("T", 25)
legend("bottomright", c(dp, db))
# default is to plot coefficient of variation
r <- revisit(e)
# show a title with the optimal conditions
mincv <- format(r$optimum, digits=3)
t1 <- paste("minimum coeff of variation,", mincv, "at:")
# the logfO2 that minimized the C.V.
basis("O2", r$x)
t2 <- describe.basis(ibasis=5)
mtitle(c(t1, as.expression(t2)))
# chemical affinities as a function of two other variables
a <- affinity(NH3=c(-10, 10, 40), T=c(0, 80, 40))
diagram(a, fill="heat")
# show a legend with input constraints
db <- describe.basis(ibasis=5)
legend("bottomright", as.expression(db))
# contour plot of the CV
e <- equilibrate(a)
r <- revisit(e)
# show a title with the optimal conditions
mincv <- format(r$optimum, digits=3)
t1 <- paste("minimum coeff of variation,", mincv, "at:")
# the logaNH3 and T that minimized the C.V.
basis("NH3", r$x)
db <- describe.basis(ibasis=3)
dp <- describe.property("T", r$y)
t2 <- substitute(list(dp, db), list(dp=dp[[1]], db=db[[1]]))
mtitle(c(t1, as.expression(t2)))
par(opar)



