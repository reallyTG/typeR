library(locfit)


### Name: panel.locfit
### Title: Locfit panel function
### Aliases: panel.locfit
### Keywords: internal

### ** Examples

stopifnot(require(lattice))

# a simple multi-panel display
data(ethanol, package="locfit")
xyplot(NOx ~ E | C, data=ethanol, panel=panel.locfit)

# The second example uses some Locfit optional arguments.
# Note we can pass the alpha (bandwidth) and family arguments directly to
# xyplot. The cens argument must be given in full; not as a data frame variable.
# The resulting plot does not (yet) distinguish the censored points, but
# the fit will correctly apply censoring.
data(border, package="locfit")
xyplot(runs ~ day, data=border, panel=panel.locfit, family="poisson",
 alpha=0.3, cens=border$no)



