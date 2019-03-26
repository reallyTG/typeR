## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5, fig.height = 5
)

## ---- echo = FALSE, results = "hide", message = FALSE--------------------
library(FossilSim)

## ------------------------------------------------------------------------
# set the random number generator seed to generate the same results using the same code
set.seed(1234)

# simulate a tree using TreeSim conditioned on tip number
lambda = 1
mu = 0.2
tips = 8
t = TreeSim::sim.bd.taxa(n = tips, numbsim = 1, lambda = lambda, mu = mu)[[1]]
# t is an object of class phylo
t
# use t$edge, t$edge.length, t$root.edge to see the tree attributes

# Simulate fossils
rate = 3 # poisson sampling rate
f = sim.fossils.poisson(rate = rate, tree = t)
f

## ------------------------------------------------------------------------
# plot fossil occurrences
plot(f, tree = t)

## ------------------------------------------------------------------------
# plot stratigraphic ranges
plot(f, tree = t, show.ranges = TRUE)

## ---- eval = FALSE, include = FALSE--------------------------------------
#  # plot stratigraphic ranges only
#  plot(f, tree = t, show.ranges = TRUE, show.fossils = FALSE, show.tree = FALSE)
#  # add stratigraphic intervals
#  plot(f, tree = t, show.strata = TRUE, strata = 4)
#  # more tips on plotting strata
#  # http://simpson-carl.github.io/articles/15/timescales.to.base

## ------------------------------------------------------------------------
# simulate taxonomy under mixed speciation
beta = 0.5 # probability of symmetric speciation
lambda.a = 1.2 # rate of anagenetic speciation
s = sim.taxonomy(tree = t, beta = beta, lambda.a = lambda.a)

# simulate fossils
f = sim.fossils.poisson(rate = rate, taxonomy = s)
f

# plot the output and color fossils by taxonomy
plot(f, tree = t, taxonomy = s, show.taxonomy = TRUE)

## ------------------------------------------------------------------------
# define max interval age based on tree age
max.age = tree.max(t)

# define the number of intervals
strata = 4

# define a vector of sampling rates, where the first entry corresponds the youngest interval
rates = c(1, 0.1, 1, 0.1)

# simulate fossils
f = sim.fossils.intervals(tree = t, rates = rates, max.age = max.age, strata = strata)
 
# plot the output
plot(f, tree = t, show.strata = TRUE, strata = strata)

## ------------------------------------------------------------------------
# the following will sample a random set of interval ages between 0 and max.age
times = c(0, sort(runif(3, min = 0, max = max.age)), max.age)

# define a vector of sampling rates from youngest to oldest
rates = c(1, 0.1, 1, 0.1)

# simulate fossils
f = sim.fossils.intervals(tree = t, rates = rates, interval.ages = times)
 
# plot the output and show sampling or proxy data
plot(f, tree = t, show.strata = TRUE, interval.ages = times, show.proxy = TRUE, proxy = rates)

## ------------------------------------------------------------------------
# define max interval age based on tree age
max.age = tree.max(t)

# define the number of intervals
strata = 4

# define a vector of sampling probabilities from youngest to oldest
probabilities = c(1.0, 0.5, 0.2, 0.1)

# simulate fossils
f = sim.fossils.intervals(tree = t, probabilities = probabilities, max.age = max.age, strata = strata)
 
# plot the output
plot(f, tree = t, show.strata = TRUE, strata = strata)

## ------------------------------------------------------------------------
# simulate fossils
f = sim.fossils.intervals(tree = t, probabilities = probabilities, max.age = max.age, strata = strata, use.exact.times = FALSE)
f

# plot the output
plot(f, tree = t, show.strata = TRUE, strata = strata)

## ------------------------------------------------------------------------
# simulate fossils
f = sim.fossils.poisson(tree = t, rate = 3)

# reassign fossils to intervals
f = sim.interval.ages(fossils = f, tree = t, max.age = max.age, strata = strata, use.species.ages = TRUE)

# plot the output
plot(f, tree = t, show.strata = TRUE, strata = strata)

## ------------------------------------------------------------------------
# define a set of colors for 4 species
# color palette chosen using RColorBrewer
cols = c("#E41A1C", "#377EB8", "#984EA3", "#4DAF4A") # red, blue, purple, green

# species response curve function
response.curve = function(x, pd, dt, pa) pa * exp(-(x - pd)^2/ (2*dt^2))

# define species variables # species 1
PA = 1 # peak abundance
PD = 2 # preferred depth
DT = 1 # depth tolerance

# plot species resonse curve
curve(response.curve(x, PD, DT, PA), -2, 6, bty = "n", xlab = "relative depth", ylab = "Pr(collection)", xlim = c(-6,6), lwd = 1.5, col = cols[1])

# redefine depth tolerance and compare the output # species 2
DT = 0.5
curve(response.curve(x, PD, DT, PA), -1, 5, add = TRUE, lwd = 1.5, col = cols[2])

# redefine preferred depth and compare the output # species 3
PD = -2
curve(response.curve(x, PD, DT, PA), -5, 1, add = TRUE, lwd = 1.5, col = cols[3])

# redefine prferred depth and peak abundance # species 4
PD = -4
PA = 0.5
curve(response.curve(x, PD, DT, PA), -6, -2.2, add = TRUE, lwd = 1.5, col = cols[4])

## ---- fig.show="hold"----------------------------------------------------
# define the interval parameters
strata = 20
times = seq(0, tree.max(t), length.out = strata+1)

# simulate gradient values
wd = sim.gradient(strata, depth = 6)

# wd is a vector representing relative water depth
wd

# define species trait values # species 1
PD = 1
DT = 2
PA = 1

# simulate fossils
f = sim.fossils.environment(tree = t, interval.ages = times, proxy.data = wd, PD = PD, DT = DT, PA = PA)

# plot output and include proxy data & preferred depth
plot(f, tree = t, interval.ages = times, show.strata = TRUE, show.proxy = TRUE, proxy.data = wd, show.preferred.environ = TRUE, preferred.environ = PD, fossil.col = cols[1])

# redefine species trait values # species 2
DT = 0.5

# simulate fossils
f = sim.fossils.environment(tree = t, interval.ages = times, proxy.data = wd, PD = PD, DT = DT, PA = PA)

# plot output
plot(f, tree = t, interval.ages = times, show.strata = TRUE, show.proxy = TRUE, proxy.data = wd, show.preferred.environ = TRUE, preferred.environ = PD, fossil.col = cols[2])

# redefine species trait values # species 3
PD = -2

# simulate fossils
f = sim.fossils.environment(tree = t, interval.ages = times, proxy.data = wd, PD = PD, DT = DT, PA = PA)

# plot output
plot(f, tree = t, interval.ages = times, show.strata = TRUE, show.proxy = TRUE, proxy.data = wd, show.preferred.environ = TRUE, preferred.environ = PD, fossil.col = cols[3])

# define species trait values # species 4
PD = -4
PA = 0.5

# simulate fossils
f = sim.fossils.environment(tree = t, interval.ages = times, proxy.data = wd, PD = PD, DT = DT, PA = PA)

# plot output
plot(f, tree = t, interval.ages = times, show.strata = TRUE, show.proxy = TRUE, proxy.data = wd, show.preferred.environ = TRUE, preferred.environ = PD, fossil.col = cols[4])

## ------------------------------------------------------------------------
# define the initial rate at the root or origin
rate = 1 

# simulate rates under the autocorrelated trait values model (the default option)
rates = sim.trait.values(init = rate, tree = t, v = 0.01)
# simulated rates
rates

# simulate fossils
f = sim.fossils.poisson(tree = t, rate = rates)

# plot the output
plot(f, tree = t)

## ------------------------------------------------------------------------
# define the initial rate at the root or origin
rate = 1

# define the distribution used to sample new rates
# in this case an exponential with mean = 1
dist = function() { rexp(1) }

# simulate trait values under the independent trait values model
rates = sim.trait.values(init = rate, tree = t, model = "independent", dist = dist)

# simulate fossils
f = sim.fossils.poisson(tree = t, rate = rates)

# plot the output
plot(f, tree = t)

## ------------------------------------------------------------------------
# define the initial value at the root or origin
rate = 1

# define the distribution used to sample new rates
# in this case an exponential with a mean ~ 3
dist = function() { rexp(1, 1/4) }

# define the probability of the trait value changing at each speciation event
change.pr = 0.5

# simulate trait values under the independent trait values model
rates = sim.trait.values(init = rate, tree = t, model = "independent", dist = dist, change.pr = change.pr)

# simulate fossils
f = sim.fossils.poisson(tree = t, rate = rates)

# plot the output
plot(f, tree = t)

## ------------------------------------------------------------------------
# define constant values for preferred depth and depth tolerance
PD = 2
DT = 0.5

# simulate lineage variable peak abundance values

# define the distribution used to sample new PA values
# in this case a uniform in the interval 0, 1
dist = function() { runif(1) }

# simulate trait values under the independent model
PA = sim.trait.values(init = 0.1, tree = t, model = "independent", dist = dist)

# simulate fossils
f = sim.fossils.environment(tree = t, interval.ages = times, proxy.data = wd, PD = PD, DT = DT, PA = PA)

# plot the output
plot(f, tree = t, show.strata = TRUE, interval.ages = times)


## ------------------------------------------------------------------------
# simulate fossils
f = sim.fossils.poisson(tree = t, rate = rates)

# simulate extant species sampling
f2 = sim.extant.samples(fossils = f, tree = t, rho = 0.5)

# plot the output
plot(f2, tree = t, extant.col = "red")

# for tip sampling only, create a fossil object with no fossils
f = fossils()

# simulate tip sampling
f2 = sim.tip.samples(fossils = f, tree = t, rho = 0.75)

# plot the output
plot(f2, tree = t)  

