library(paleotree)


### Name: simFossilRecord
### Title: Full-Scale Simulations of the Fossil Record with Birth, Death
###   and Sampling of Morphotaxa
### Aliases: simFossilRecord

### ** Examples


set.seed(2)

# quick birth-death-sampling run with 1 run, 50 taxa

record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1,
	nTotalTaxa = 50, plot = TRUE)

## No test: 
 
# examining multiple runs of simulations

#example of repeated pure birth simulations over 50 time-units
records <- simFossilRecord(p = 0.1, q = 0, nruns = 10,
	totalTime = 50, plot = TRUE)
#plot multiple diversity curves on a log scale
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE,plotLogRich = TRUE)
#histogram of total number of taxa
hist(sapply(records,nrow))

#example of repeated birth-death-sampling simulations over 50 time-units
records <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 10,
	totalTime = 50, plot = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)

#like above, but conditioned instead on having 10 extant taxa
	# between 1 and 100 time-units
set.seed(4)
records <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 10,
	totalTime = c(1,300), nExtant = 10, plot = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)

################################################

# How probable were the runs I accepted?
	# The effect of conditions

set.seed(1)

# Let's look at an example of a birth-death process
	# with high extinction relative to branching
# use default run conditions (barely any conditioning)
# use print.runs to look at acceptance probability
records <- simFossilRecord(p = 0.1, q = 0.8, nruns = 10,
	print.runs = TRUE, plot = TRUE)
# 10 runs accepted from a total of 10 !

# now let's give much more stringent run conditions
	# require 3 extant taxa at minimum, 5 taxa total minimum
records <- simFossilRecord(p = 0.1, q = 0.8, nruns = 10,
	nExtant = c(3,100), nTotalTaxa = c(5,100),
	print.runs = TRUE, plot = TRUE)
# thousands of simulations to just obtail 10 accepable runs!
	# most ended in extinction before minimums were hit

# beware analysis of simulated where acceptance conditions 
	# are too stringent: your data will be a 'special case'
	# of the simulation parameters
# it will also take you a long time to generate reasonable
	# numbers of replicates for whatever analysis you are doing

# TLDR: You should look at print.runs = TRUE

######################

# Using the rate equation-input for complex diversification models

# First up... Diversity Dependent Models!
# Let's try Diversity-Dependent Branching over 50 time-units

# first, let's write the rate equation
# We'll use the diversity dependent rate equation model
	# from Ettienne et al. 2012 as an example here
	# Under this equation, p = q at carrying capacity K
# Many others are possible!
# Note that we don't need to use max(0,rate) as negative rates
	# are converted to zero by default, as controlled by
	# the argument negRatesAsZero

# From Ettiene et al.
#	lambda = lambda0 - (lambda0 - mu)*(n/K)
# lambda and mu are branching rate and extinction rate
	# lambda and mu  ==  p and q in paleotree (i.e. Foote convention)
# lambda0 is the branching rate at richness = 0
# K is the carrying capacity
# n is the richness

# 'N' is the algebra symbol for standing taxonomic richness 
	# for simFossilRecord's simulation capabilities
# also branching rate cannot reference extinction rate
# we'll have to set lambda0, mu and K in the rate equation directly

lambda0 <- 0.3	# branching rate at 0 richness in Ltu
K <- 40		# carrying capacity 
mu <- 0.1		# extinction rate will 0.1 Ltu ( =  1/3 of lambda0)

# technically, mu here represents the lambda at richness = K
	# i.e. lambdaK
# Ettienne et al. are just implicitly saying that the carrying capacity
	# is the richness at which lambda == mu

# construct the equation programmatically using paste0
branchingRateEq <- paste0(lambda0,"-(",lambda0,"-",mu,")*(N/",K,")")
# and take a look at it...
branchingRateEq
# its a thing of beauty, folks

# now let's try it
records <- simFossilRecord(p = branchingRateEq, q = mu, nruns = 3,
	totalTime = 100, plot = TRUE, print.runs = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)
# those are some happy little diversity plateaus!


# now let's do diversity-dependent extinction

# let's slightly modify the model from Ettiene et al.
#	mu = mu0 + (mu0 - muK)*(n/K)

mu0 <- 0.001		# mu at n = 0
muK <- 0.1		# mu at n = K (should be equal to lambda at K)
K <- 40
lambda <- muK		# equal to muK

# construct the equation programmatically using paste0
extRateEq <- paste0(mu0,"-(",mu0,"-",muK,")*(N/",K,")")
extRateEq

# now let's try it
records <- simFossilRecord(p = lambda, q = extRateEq, nruns = 3,
	totalTime = 100, plot = TRUE, print.runs = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)

# these plateaus looks a little more spiky 
	#( maybe there is more turnover at K? )
# also, it took a longer for the rapid rise to occur

# Now let's try an example with time-dependent origination
	# and extinction constrained to equal origination

# Note! Use of time-dependent parameters "D" and "T" may
# result in slower than normal simulation run times
# as the time-scale has to be discretized; see
# info for argument maxTimeStep above

# First, let's define a time-dependent rate equation
	# "T" is the symbol for time passed
timeEquation <- "0.4-(0.007*T)"

#in this equation, 0.4 is the rate at time = 0
	# and it will decrease by 0.007 with every time-unit
	# at time = 50, the final rate will be 0.05
# We can easily make it so extinction is always equal to branching rate
# "P" is the algebraic equivalent for "branching rate" in simFossilRecord

# now let's try it
records <- simFossilRecord(p = timeEquation, q = "P", nruns = 3,
	totalTime = 50, plot = TRUE, print.runs = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)
# high variability that seems to then smooth out as turnover decreases

# And duration what about duration-dependent processes?
	# let's do a duration-dep extinction equation:
durDepExt <- "0.01+(0.01*D)"

# okay, let's take it for a spin
records <- simFossilRecord(p = 0.1, q = durDepExt, nruns = 3,
	totalTime = 50, plot = TRUE, print.runs = TRUE)
records <- lapply(records,fossilRecord2fossilTaxa)
multiDiv(records,plotMultCurves = TRUE)
# creates runs full of short lived taxa

# Some more stuff to do with rate formulae!

# The formulae input method for rates allows
	# for the rate to be a random variable

# For example, we could constantly redraw
 		# the branching rate from an exponential

record <- simFossilRecord(
  p = "rexp(n = 1,rate = 10)",
  q = 0.1, r = 0.1, nruns = 1,
	 nTotalTaxa = 50, plot = TRUE)

# Setting up specific time-variable rates can be laborious though
	# e.g. one rate during this 10 unit interval, 
		# another during this interval, etc
	# The problem is setting this up within a fixed function

# Worked Example
# What if we want to draw a new rate from a
	# lognormal distribution every 10 time units?

# Need to randomly draw these rates *before* running simFossilTaxa
# This means also that we will need to individually do each simFossilTaxa run
	# since the rates are drawn outside of simFossilTaxa

# Get some reasonable log normal rates:
rates <- 0.1+rlnorm(100,meanlog = 1,sdlog = 1)/100

# Now paste it into a formulae that describes a function that
	# will change the rate output every 10 time units
rateEquation <- paste0("c(",paste0(rates,collapse = ","),")[1+(T%/%10)]")

# and let's run it
record <- simFossilRecord(p = rateEquation, q = 0.1, r = 0.1, nruns = 1,
	totalTime = c(30,40), plot = TRUE)

 
##########################################################

# Speciation Modes
# Some examples of varying the 'speciation modes' in simFossilRecord

# The default is pure budding cladogenesis
	# anag.rate = prop.bifurc = prop.cryptic = 0
# let's just set those for the moment anyway
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0,
	nruns = 1, nTotalTaxa = c(20,30) ,nExtant = 0, plot = TRUE)

#convert and plot phylogeny
	# note this will not reflect the 'budding' pattern
	# branching events will just appear like bifurcation
	# its a typical convention for phylogeny plotting
converted <- fossilRecord2fossilTaxa(record)
tree <- taxa2phylo(converted,plot = TRUE)

#now, an example of pure bifurcation
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 1, prop.cryptic = 0,
	nruns = 1, nTotalTaxa = c(20,30) ,nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)

# all the short branches are due to ancestors that terminate
	# via pseudoextinction at bifurcation events

# an example with anagenesis = branching
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0.1, prop.bifurc = 0, prop.cryptic = 0,
	nruns = 1, nTotalTaxa = c(20,30) ,nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)
# lots of pseudoextinction

# an example with anagenesis, pure bifurcation
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0.1, prop.bifurc = 1, prop.cryptic = 0,
	nruns = 1, nTotalTaxa = c(20,30) ,nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)
# lots and lots of pseudoextinction

# an example with half cryptic speciation
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0.5,
	nruns = 1, nTotalTaxa = c(20,30), nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)

# notice that the tree has many more than the maximum of 30 tips:
	# that's because the cryptic taxa are not counted as
	# separate taxa by default, as controlled by count.cryptic

# an example with anagenesis, bifurcation, cryptic speciation
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0.1, prop.bifurc = 0.5, prop.cryptic = 0.5,
	nruns = 1, nTotalTaxa = c(20,30), nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)
# note in this case, 50% of branching is cryptic
	# 25% is bifurcation, 25% is budding

# an example with anagenesis, pure cryptic speciation
	# morphotaxon identity will thus be entirely indep of branching!
	# I wonder if this is what is really going on, sometimes...
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0.1, prop.bifurc = 0, prop.cryptic = 1,
	nruns = 1, nTotalTaxa = c(20,30), nExtant = 0)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record),plot = TRUE)

# merging cryptic taxa when all speciation is cryptic
set.seed(1)
record <- simFossilRecord(p = 0.1,
	q = 0.1, r = 0.1,
	prop.crypt = 1,
	totalTime = 50, plot = TRUE)
# there looks like there is only a single taxon, but...
length(record)	#actual number of cryptic lineages

#############

# playing with count.cryptic with simulations of pure cryptic speciation

#can choose to condition on total morphologically-distinguishable taxa
    #or total taxa including cryptic taxa with count.cryptic = FALSE

# an example with pure cryptic speciation with count.cryptic = TRUE
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 1,
	nruns = 1, totalTime = 50, nTotalTaxa = c(10,100), count.cryptic = TRUE)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record))
plot(tree);axisPhylo()
# notice how the tip labels indicate all are the same morphotaxon

# we'll replace the # of taxa constraints with a time constraint
	# or else the count.cryptic = FALSE simulation will never end!

# an example with pure cryptic speciation with count.cryptic = FALSE
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 1,
	nruns = 1, totalTime = 50, count.cryptic = FALSE)
tree <- taxa2phylo(fossilRecord2fossilTaxa(record))
plot(tree);axisPhylo()

#let's look at numbers of taxa returned when varying count.cryptic
	# with prop.cryptic = 0.5

#simple simulation going for 50 total taxa	

#first, count.cryptic = FALSE (default)
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0.5,
	nruns = 1, nTotalTaxa = 50, count.cryptic = FALSE)
taxa <- fossilRecord2fossilTaxa(record)
nrow(taxa)               #number of lineages (inc. cryptic)
length(unique(taxa[,6]))     #number of morph-distinguishable taxa

# and count.cryptic = TRUE
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0.5,
	nruns = 1, nTotalTaxa = 50, count.cryptic = TRUE)
taxa <- fossilRecord2fossilTaxa(record)
nrow(taxa)                #number of lineages (inc. cryptic)
length(unique(taxa[,6]))     #number of morph-distinguishable taxa

# okay...
# now let's try with 50 extant taxa

#first, count.cryptic = FALSE (default)
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0.5,
	nruns = 1, nExtant = 10, totalTime = c(1,100), count.cryptic = FALSE)
taxa <- fossilRecord2fossilTaxa(record)
sum(taxa[,5])            #number of still-living lineages (inc. cryptic)
length(unique(taxa[taxa[,5] == 1,6]))	#number of still-living morph-dist. taxa

# and count.cryptic = TRUE
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
	anag.rate = 0, prop.bifurc = 0, prop.cryptic = 0.5,
	nruns = 1, nExtant = 10, totalTime = c(1,100), count.cryptic = TRUE)
taxa <- fossilRecord2fossilTaxa(record)
sum(taxa[,5])           #number of still-living lineages (inc. cryptic)
length(unique(taxa[taxa[,5] == 1,6]))	#number of still-living morph-dist. taxa

#################################################

# an example using startTaxa to have more initial taxa
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1,
nTotalTaxa = 100, startTaxa = 20, plot = TRUE)

######################################################

# Using run conditions

# Users can generate datasets that meet multiple conditions:
	# such as time, number of total taxa, extant taxa, sampled taxa
# These can be set as point conditions or ranges

# let's set time = 10-100 units, total taxa = 30-40, extant = 10
	#and look at acceptance rates with print.run
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1, 
	totalTime = c(10,100), nTotalTaxa = c(30,40), nExtant = 10,
	print.runs = TRUE, plot = TRUE)

# let's make the constraints on totaltaxa a little tighter
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1, 
	totalTime = c(50,100), nTotalTaxa = 30, nExtant = 10,
	print.runs = TRUE, plot = TRUE)
# still okay acceptance rates

# alright, now let's add a constraint on sampled taxa
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1, 
	totalTime = c(50,100), nTotalTaxa = 30, nExtant = 10,
	nSamp = 15, print.runs = TRUE, plot = TRUE)
# still okay acceptance rates

# we can be really odd and condition on having a single taxon
set.seed(1)
record <- simFossilRecord(p = 0.1,
q = 0.1, r = 0.1, nTotalTaxa = 1,
totalTime = c(10,20), plot = TRUE)

########################################################

# Simulations of entirely extinct taxa

#Typically, a user may want to condition on a precise
	# number of sampled taxa in an all-extinct simulation
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1, 
	nTotalTaxa = c(1,100), nExtant = 0, nSamp = 20,
	print.runs = TRUE, plot = TRUE)

# Note that when simulations don't include
# sampling or extant taxa, the plot 
# functionality changes
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0, nruns = 1, 
	nExtant = 0, print.runs = TRUE, plot = TRUE)
# something similar happens when there is no sampling
# and there are extant taxa but they aren't sampled
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0, nruns = 1, 
	nExtant = 10, nTotalTaxa = 100, modern.samp.prob = 0,
	print.runs = TRUE, plot = TRUE)


# We can set up a test to make sure that no extant taxa somehow get
# returned in many simulations with extinct-only conditioning:
res <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1,
   nTotalTaxa = 10,nExtant = 0,nruns = 1000,plot = TRUE)
anyLive <- any(sapply(res,function(z) 
   any(sapply(z,function(x) x[[1]][5] == 1))))
# test if any are still alive
if(anyLive){
stop("Runs have extant taxa under conditioning for none?")
}

## End(No test)




