library(surveillance)


### Name: epidata
### Title: Continuous-Time SIR Event History of a Fixed Population
### Aliases: as.epidata as.epidata.data.frame as.epidata.default
###   print.epidata [.epidata update.epidata epidata
### Keywords: spatial classes manip

### ** Examples

# see help("hagelloch") for an example with a real data set

# here is an artificial event history
data("foodata")
str(foodata)

# convert the data to an object of class "epidata",
# also generating some epidemic covariates
myEpidata <- as.epidata(foodata,
  id.col = 1, start.col = "start", stop.col = "stop",
  atRiskY.col = "atrisk", event.col = "infected", Revent.col = "removed",
  coords.cols = c("x","y"),
  f = list(B1 = function(u) u <= 1, B2 = function(u) u > 1))

# this is how data("fooepidata") has been generated
data("fooepidata")
stopifnot(all.equal(myEpidata, fooepidata))

# add covariate-based weight for the force of infection, e.g.,
# to model an increased force if i and j have the same value in z1
myEpidata2 <- update(fooepidata,
                     w = list(samez1 = function(z1.i, z1.j) z1.i == z1.j))

str(fooepidata)
subset(fooepidata, BLOCK == 1)

summary(fooepidata)          # see 'summary.epidata'
plot(fooepidata)             # see 'plot.epidata' and also 'animate.epidata'
stateplot(fooepidata, "15")  # see 'stateplot'



