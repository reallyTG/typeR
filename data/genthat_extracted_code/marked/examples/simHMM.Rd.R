library(marked)


### Name: simHMM
### Title: Simulates data from Hidden Markov Model
### Aliases: simHMM

### ** Examples

## No test: 
# simulate phi(.) p(.) with 1000 Females and 100 males, 3 occasions all released on first occasion
df=simHMM(data.frame(ch=c("100","110"),sex=factor(c("F","M")),freq=c(1000,100),
   stringsAsFactors=FALSE))
df=simHMM(data.frame(ch=rep("100",100),u=rnorm(100,0,1),freq=rep(1,100),
  stringsAsFactors=FALSE),
  model.parameters=list(Phi=list(formula=~u),p=list(formula=~time)),
   initial=list(Phi=c(1,1),p=c(0,1)))
df=simHMM(data.frame(ch=c("1000","0100","0010"),freq=rep(50,3),stringsAsFactors=FALSE),
  model.parameters=list(Phi=list(formula=~1),p=list(formula=~time)),
    initial=list(Phi=c(1),p=c(0,1,2)))

######################################################################## 
# Example developed by Jay Rotella, Montana State University
# example of using the 'simHMM' function in 'marked' package for
#  a multi-state model with 3 states

# simulate a single release cohort of 1000 animals with 1 release from 
#  each of the 3 states for 10 recapture occasions; 
# Note: at least 2 unique ch are needed in simHMM
simd <- data.frame(ch = c("A0000000000", "B0000000000", "C0000000000"),
	freq = c(1000, 1000, 1000),
	stringsAsFactors = FALSE)

# define simulation/fitting model; default for non-specified parameters is ~1
# but all are listed here. For the formula for Psi, the -1 is necessary to remove
# the intercept which is not needed and would be redundant. 
# The formula '~ -1 + stratum:tostratum' is often appropriate for multi-state
# transitions as it allows different values for Psi depending on 
# the current state (state at time t) and the new state (state at t+1). 
modelspec <- list(
	S = list(formula = ~ -1 + stratum),
	# by presenting the formula for S as '~-1+stratum', it is possible to 
	# present the desired survival rates directly for each group in the 
	# simulations (see how 'initial' is created below) for this simple
	# scenario where survival varies by stratum but no other covariates
	p = list(formula = ~ 1),
	Psi = list(formula =  ~ -1 + stratum:tostratum))

# process data with A,B,C strata
sd <- process.data(simd,
	model = "hmmMSCJS",
	strata.labels = c("A", "B", "C"))

# create design data
ddl <- make.design.data(sd)
# view design data (especially important for seeing which order to present
#  beta values used to set probabilities for various transitions)
head(model.matrix(~stratum, ddl$S))
head(model.matrix(~-1+stratum:tostratum, ddl$Psi), 9)

# set initial parameter values for model S=~stratum, p=~1, Psi=~stratum:tostratum
initial <- list(S = c(log(0.8/0.2), log(0.6/0.4), log(0.5/0.5)),
	p = log(0.6/0.4),
	# order of presentation is BA, CA, AB, CB, AC, BC
	# Note: values for AA, BB, CC are obtained by subtraction
	Psi = c(log(0.2/0.6), log(0.3/0.1),   # Psi(BA) & Psi(CA)
			log(0.3/0.5), log(0.6/0.1),   # Psi(AB) & Psi(CB)
			log(0.2/0.5), log(0.2/0.6)))  # Psi(AC) & Psi(BC)
# The desired probabilties for the transition matrix for Psi are as follows
#        To:
# From:    A   B    C
#    A   .5   .3   .2
#    B   .2   .6   .2
#    C   .3   .6   .4
# The values in the list above are obtained using the transitions AA, BB, CC
#  as reference values in the denominator of log-odds calculations. 
# For example, to achieve the desired probabilities for the transition 
#  from A to B use log(0.3/0.5) and from A to C use log(0.2/0.5)
# exp(log(0.3/0.5))/(1 + exp(log(0.3/0.5)) + exp(log(0.2/0.5))) = 0.3
# exp(log(0.2/0.5))/(1 + exp(log(0.3/0.5)) + exp(log(0.2/0.5))) = 0.2
# Note:           1/(1 + exp(log(0.3/0.5)) + exp(log(0.2/0.5))) = 0.5

# call simmHMM to get a single realization
realization <- simHMM(sd, ddl, model.parameters = modelspec, 
		initial = initial)

# using that realization, process data and make design data
# note that the analysis can also use model="MSCJS" in marked or "Multistrata" in RMark
# it is only the simulation that requires specification as an HMM.
sd <- process.data(realization, model = "hmmMSCJS",
	strata.labels = c("A","B","C"))
rddl <- make.design.data(sd)

# fit model
m <- crm(sd, rddl, model.parameters = modelspec,
	hessian = TRUE)

# model output
m$results$beta
initial
m$results$reals
## End(No test)



