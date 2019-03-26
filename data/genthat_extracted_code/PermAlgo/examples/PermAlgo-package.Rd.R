library(PermAlgo)


### Name: PermAlgo-package
### Title: Generate Event Times Conditional On Time-Dependent Covariates
### Aliases: PermAlgo-package PermAlgo
### Keywords: survival

### ** Examples


# Example - Generating adverse event conditional on use
# of prescription drugs

# Prepare the matrice of covariate (Xmat)
# Here we simulate daily exposures to 2 prescription drugs over a
# year. Drug prescriptions can start any day of follow-up, and their
# duration is a multiple of 7 days. There can be multiple prescriptions
# for each individuals over the year and interuptions of drug use in
# between.

# Additionaly, there is a time-independant binary covarite (sex).

n=500 # subjects
m=365 # days

# Generate the matrix of three covariate, in a 'long' format.
Xmat=matrix(ncol=3, nrow=n*m)

# time-independant binary covariate
Xmat[,1] <- rep(rbinom(n, 1, 0.3), each=m)

# Function to generate an individual time-dependent exposure history
# e.g. generate prescriptions of different durations and doses.
TDhist <- function(m){
  start <- round(runif(1,1,m),0) # individual start date
  duration <-  7 + 7*rpois(1,3) # in weeks
  dose <-  round(runif(1,0,10),1) 
  vec <- c(rep(0, start-1), rep(dose, duration))
  while (length(vec)<=m){
    intermission <- 21 + 7*rpois(1,3) # in weeks
    duration <-  7 + 7*rpois(1,3) # in weeks
    dose <-  round(runif(1,0,10),1)
    vec <- append(vec, c(rep(0, intermission), rep(dose, duration)))}
  return(vec[1:m])}

# create TD var
Xmat[,2] <- do.call("c", lapply(1:n, function(i) TDhist(m)))
Xmat[,3] <- do.call("c", lapply(1:n, function(i) TDhist(m)))

# genereate vectors of event and censoring times prior to calling the
# function for the algorithm

eventRandom <- round(rexp(n, 0.012)+1,0)
censorRandom <- round(runif(n, 1,870),0)

# Generate the survival data conditional on the three covariates

data <- permalgorithm(n, m, Xmat, XmatNames=c("sex", "Drug1", "Drug2"),
eventRandom = eventRandom, censorRandom=censorRandom, betas=c(log(2),
log(1.04), log(0.99)), groupByD=FALSE )

# could use survival library and check whether the data was generated
# properly using coxph(Surv(Start, Stop, Event) ~ sex + Drug1 + Drug2,
# data)




