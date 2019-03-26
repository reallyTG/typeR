library(FuzzyStatProb)


### Name: fuzzyStationaryProb
### Title: Fuzzy stationary probabilities of Markov chains from
###   observations
### Aliases: fuzzyStationaryProb

### ** Examples

# ----------------- CREATE DATA ----------
# Simulate 200 observations of a 10-state Markov chain, 
# and compute fuzzy stationary probability of state 1
if(require("markovchain")){ # for simulating from a known crisp Markov chain
	# Transition matrix taken from Fig. 1 of Amigoni et al. (see references)
	mcPatrol <- new("markovchain", states = robotStates, byrow = TRUE,
	transitionMatrix = transRobot, name = "Patrolling")
	set.seed(666)
	simulatedData <- rmarkovchain(n = 200, object = mcPatrol, t0 = 
  sample(robotStates, 1))
	mcfit = markovchainFit(simulatedData) # Fit with markovchain package
	vsteady = steadyStates(mcfit$estimate) # 1 x n matrix of stat. probs
	# ---------------------------------------
	# Simplest case: compute only alpha-cuts for alpha=0.001 and alpha=0.999
	# Set itermax to 30 (too few) just for a fast example (not good results)
	linear = fuzzyStationaryProb(simulatedData,list(verbose=TRUE, states="01", 
  	regression="piecewise"), step=1, itermax = 30) 
	summary(linear)
	linear$fuzzyStatProb[["01"]]
	plot(linear$fuzzyStatProb[["01"]])
	points(linear$acuts[["01"]])
}
## Not run: 
##D # A more accurate approximation, with steps of 0.1 (takes much longer!)
##D # Run the previous code to create mcPatrol, vsteady and simlatedData
##D quadratic = fuzzyStationaryProb(data = simulatedData,list(verbose=TRUE, 
##D   ncores = 2, regression="quadratic"), step=0.1)
##D m <- matrix(c(1,2,3,4,5,6,7,8,9,10,11,11),nrow = 4,ncol = 3,byrow = TRUE)
##D layout(mat = m,heights = c(0.25,0.25,0.25,0.25))
##D for (i in robotStates){
##D par(mar = c(4,4,2,1))
##D     plot(quadratic$fuzzyStatProb[[i]],col="red",main=paste("State ",i), 
##D       cex.lab = 1.1,lwd=2);    
##D     points(quadratic$acuts[[i]]);
##D     abline(v = vsteady[1,i], lty = "dashed");
##D }
##D plot(1, type = "n", axes=FALSE, xlab="", ylab="")
##D plot_colors <- c("red")
##D legend(x = "top",inset = 0, legend = c("Quadratic"), col=plot_colors, 
##D   bty = "n", lwd=2, cex=1, horiz = FALSE)
##D 
##D # Now departing from user-specified fuzzy transition probabilities
##D library(FuzzyNumbers)
##D EU = TrapezoidalFuzzyNumber(0,0,0.02,0.07); # Extremely unlikely 
##D VLC = TrapezoidalFuzzyNumber(0.04,0.1,0.18,0.23); # Very low chance
##D SC = TrapezoidalFuzzyNumber(0.17,0.22,0.36,0.42); # Small chance
##D IM = TrapezoidalFuzzyNumber(0.32,0.41,0.58,0.65); # It may
##D MC = TrapezoidalFuzzyNumber(0.58,0.63,0.8,0.86); # Meaningful chance
##D ML = TrapezoidalFuzzyNumber(0.72,0.78,0.92,0.97); # Most likely
##D EL = TrapezoidalFuzzyNumber(0.93,0.98,1,1); # Extremely likely
##D allnumbers = c(EU,VLC,SC,IM,MC,ML,EL);
##D names(allnumbers) = c("EU","VLC","SC","IM","MC","ML","EL");
##D rownames(linguisticTransitions) = robotStates; # see the package data
##D colnames(linguisticTransitions) = robotStates;
##D 
##D # Simplest case: compute only alpha-cuts for alpha=0.001 and alpha=0.999
##D # linguisticTransitions is a matrix of strings defined in the package data
##D linear = fuzzyStationaryProb(linguisticTransitions,list(verbose=TRUE, 
##D   regression="linear", ncores = 4, fuzzynumbers = allnumbers),step=0.2)
##D summary(linear)
## End(Not run)



