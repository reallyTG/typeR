library(ltmle)


### Name: ltmle
### Title: Longitudinal Targeted Maximum Likelihood Estimation
### Aliases: ltmle ltmleMSM

### ** Examples


rexpit <- function(x) rbinom(n=length(x), size=1, prob=plogis(x))
                 
# Example 1: Single time point example. True value of E[Y_1] (expected value of
#   Y setting A to 1) is approximately 0.5939.
set.seed(2)
n <- 1000
W1 <- rnorm(n)
W2 <- rbinom(n, size=1, prob=0.3)   
W3 <- rnorm(n)
A <- rexpit(-1 + 2 * W1^2)
Y <- rexpit(-0.5 + 2 * W1^2 + 0.5 * W2 - 0.5 * A + 0.2 * W3 * A 
       - 1.1 * W3 + 0.2 * rnorm(n))

data <- data.frame(W1, W2, W3, A, Y)


## No test: 
 #This takes about 4 seconds to run
library(SuperLearner)

#SuperLearner semiparametric estimation using all parents as regressors 
result1 <- ltmle(data, Anodes="A", Lnodes=NULL, Ynodes="Y", abar=1, 
  SL.library=c("SL.glm", "SL.step", "SL.mean"))
summary(result1)
summary(result1, estimator="iptw")

#SuperLearner semiparametric estimation using correctly specified regressors
result1a <- ltmle(data, Anodes="A", Lnodes=NULL, Ynodes="Y", 
 Qform=c(Y="Q.kplus1 ~ I(W1^2) + W2 + W3*A"), gform="A ~ I(W1^2)", abar=1, 
 SL.library=c("SL.glm", "SL.step", "SL.mean"))
summary(result1a)
## End(No test)

#glm using correctly specified Qform and gform
result.abar1 <- ltmle(data, Anodes="A", Lnodes=NULL, Ynodes="Y", 
 Qform=c(Y="Q.kplus1 ~ I(W1^2) + W2 + W3*A"), gform="A ~ I(W1^2)", 
 abar=1, SL.library=NULL)

## No test: 
 #This takes about 18 seconds to run
#Get summary measures (additive treatment effect, odds ratio, relative risk) 
#  for abar=1 vs abar=0
result.compare <- ltmle(data, Anodes="A", Lnodes=NULL, Ynodes="Y", 
                      Qform=c(Y="Q.kplus1 ~ I(W1^2) + W2 + W3*A"), gform="A ~ I(W1^2)", 
                      abar=list(1, 0), SL.library=NULL)
summary(result.compare)


# Example 2: Longitudinal example. Includes informative censoring and treatment. 
# Time ordering of data is W, C1, L1, A1, Y1, C2, L2, A2, Y2
# True value of E[Y_(1,1,1,1)] (expected value of Y setting C1, A1, C2, A2 all to 1)
#  is approximately 0.413.
# A1 is known to always be 1 if L1 < -2, and is 1 with probability 0.1 if L1 > 2 
# A2 is known to always be 1 if A1 is 1 
# We incorporate this knowledge using deterministic.g.function

# Generate data:
set.seed(2)
ua <- rep(TRUE, n)   #ua = uncensored and alive
L1 <- A1 <- Y1 <- C2.binary <- L2 <- A2 <- Y2 <- as.numeric(rep(NA, n))
W <- rnorm(n)
C1 <- BinaryToCensoring(is.uncensored=rexpit(2 + W))
ua <- ua & C1 == "uncensored"
L1[ua] <- rnorm(n)[ua] + W[ua]
A1[ua] <- rexpit(L1[ua])
A1[ua & L1 < -2] <- 1
A1[ua & L1 >  2] <- rbinom(n, size=1, prob=0.1)[ua & L1 >  2]
Y1[ua] <- rexpit((W + L1 - A1)[ua])
ua <- ua & !Y1
C2.binary[ua] <- rexpit((1 + 0.7 * L1 - A1)[ua])
C2 <- BinaryToCensoring(is.uncensored=C2.binary)
ua <- ua & C2 == "uncensored"
L2[ua] <- (0.5 * L1 - 0.9 * A1 + rnorm(n))[ua]
A2[ua] <- rexpit((0.5 * L1 + 0.8 * L2)[ua]) | A1[ua]
Y2[ua] <- rexpit((0.7 * L1 + L2 - 0.8 * A1 - A2)[ua])
Y2[Y1 == 1] <- 1  # if a patient dies at time 1, record death at time 2 as well
data <- data.frame(W, C1, L1, A1, Y1, C2, L2, A2, Y2)

deterministic.g.function <- function(data, current.node, nodes) {
  if (names(data)[current.node] == "A1") {
    det <- (data$L1 < -2 | data$L1 > 2) & !is.na(data$L1)
    prob1 <- ((data$L1 < -2) * 1 + (data$L1 > 2) * 0.1)[det]
  } else if (names(data)[current.node] == "A2") {
    det <- data$A1 == 1 & !is.na(data$A1)
    prob1 <- 1
  } else if (names(data[current.node]) %in% c("C1", "C2")){
    return(NULL)  #this returns the default of no deterministic links 
    #note that it is not necessary to specify that prior censoring indicates future censoring
  } else {
    stop("unexpected current.node")
  }
  return(list(is.deterministic=det, prob1=prob1))  
}

result2 <- ltmle(data, Anodes=c("A1","A2"), Cnodes=c("C1", "C2"), 
                Lnodes=c("L1", "L2"), Ynodes=c("Y1", "Y2"), abar=c(1, 1), 
                deterministic.g.function=deterministic.g.function, survivalOutcome=TRUE)
summary(result2) 
 
# Example 3: Dynamic treatment, observation weights
# W -> A1 -> L -> A2 -> Y
# Treatment regime of interest is: Always treat at time 1 (A1 = 1), 
#   treat at at time 2 (A2 = 1), iff L > 0
# Weight by pmax(W + 2, 0)

set.seed(2)
n <- 1000
W <- rnorm(n)
A1 <- rexpit(W)
L <- 0.3 * W + 0.2 * A1 + rnorm(n)
A2 <- rexpit(W + A1 + L)
Y <- rexpit(W - 0.6 * A1 + L - 0.8 * A2)
data <- data.frame(W, A1, L, A2, Y)

abar <- matrix(nrow=n, ncol=2)
abar[, 1] <- 1
abar[, 2] <- L > 0

result3 <- ltmle(data, Anodes=c("A1", "A2"), Lnodes="L", Ynodes="Y", 
  survivalOutcome=TRUE, abar=abar, observation.weights = pmax(W + 2, 0))
summary(result3)

# Example 3.1: The regime can also be specified as a rule function

rule <- function(row) c(1, row["L"] > 0)

result.rule <- ltmle(data, Anodes=c("A1", "A2"), Lnodes="L", Ynodes="Y", 
  survivalOutcome=TRUE, rule=rule, observation.weights = pmax(W + 2, 0))
# This should be the same as the above result
summary(result.rule)

# Example 4: Deterministic Q function
# W -> A1 -> Y1 -> L2 -> A2 -> Y2
set.seed(2)
n <- 200
L2 <- A2 <- Y2 <- as.numeric(rep(NA, n))
W <- rnorm(n)
A1 <- rexpit(W)
Y1 <- rexpit(W - A1)
alive <- Y1 == 0
L2[alive] <- (0.5 * W - 0.9 * A1 + rnorm(n))[alive]
completed.study <- alive & L2 > 0

#Specify that Q is deterministically 0 when L2 is in the history of the 
# current Q regression and L2 > 0
#Note 1: det.Q.fun doesn't condition on called.from.estimate.g so g will also be set 
#        deterministically after L2 > 0 
#Note 2: It is not necessary to specify that Q is deterministically 1 if Y1 is 1; this is automatic
det.Q.fun.4a <- function(data, current.node, nodes, called.from.estimate.g) {
  L2.index <- which(names(data) == "L2")
  stopifnot(length(L2.index) == 1)
  L2.in.history <- L2.index < current.node
  if (! L2.in.history) return(NULL)
  
  is.deterministic <- data$L2 > 0 & !is.na(data$L2)
  return(list(is.deterministic=is.deterministic, Q.value=0))
}

#patients don't change treatment after leaving study; leave their A2 as NA
A2[alive & !completed.study] <- rexpit((0.5 * W + 0.8 * L2)[alive & !completed.study])

Y2[alive & !completed.study] <- rexpit((L2 - 0.8 * A1 - A2)[alive & !completed.study])
Y2[alive & completed.study] <- 0
Y2[!alive] <- 1  # if a patient dies at time 1, record death at time 2 as well
data <- data.frame(W, A1, Y1, L2, A2, Y2)

result4a <- ltmle(data, Anodes=c("A1","A2"), Lnodes="L2", Ynodes=c("Y1", "Y2"), abar=c(1, 1), 
  SL.library=NULL, estimate.time=FALSE, deterministic.Q.function=det.Q.fun.4a, survivalOutcome=TRUE)
#note: You will get the same result if you pass Lnodes=NULL (see next example)
summary(result4a)

#In this variation, suppose that treatment can still change after a patient leaves the study

det.Q.fun.4b <- function(data, current.node, nodes, called.from.estimate.g) {
  #there is no deterministic information when calculating g - treatment may still change
  if (called.from.estimate.g) return(NULL)  
  
  L2.index <- which(names(data) == "L2")
  stopifnot(length(L2.index) == 1)
  L2.in.history <- L2.index < current.node
  if (! L2.in.history) return(NULL)
  
  is.deterministic <- data$L2 > 0 & !is.na(data$L2)
  return(list(is.deterministic=is.deterministic, Q.value=0))
}

A2[alive] <- rexpit((0.5 * W + 0.8 * L2)[alive])  #patients can change treatment after leaving study
Y2[alive & !completed.study] <- rexpit((L2 - 0.8 * A1 - A2)[alive & !completed.study])
Y2[alive & completed.study] <- 0
Y2[!alive] <- 1  # if a patient dies at time 1, record death at time 2 as well
data <- data.frame(W, A1, Y1, L2, A2, Y2)

result4b <- ltmle(data, Anodes=c("A1","A2"), Lnodes="L2", Ynodes=c("Y1", "Y2"), abar=c(1, 1), 
 SL.library=NULL, estimate.time=FALSE, deterministic.Q.function=det.Q.fun.4b, survivalOutcome=TRUE)
summary(result4b)

# Example 5: Multiple time-dependent covariates and treatments at each time point, 
#            continuous Y values
# age -> gender -> A1 -> L1a -> L1b -> Y1 -> A2 -> L2a -> L2b -> Y2
set.seed(2)
n <- 100
age <- rbinom(n, 1, 0.5)
gender <- rbinom(n, 1, 0.5)
A1 <- rexpit(age + gender)
L1a <- 2*age - 3*gender + 2*A1 + rnorm(n)
L1b <- rexpit(age + 1.5*gender - A1)
Y1 <- plogis(age - gender + L1a + 0.7*L1b + A1 + rnorm(n))
A2 <- rexpit(age + gender + A1 - L1a - L1b)
L2a <- 2*age - 3*gender + 2*A1 + A2 + rnorm(n)
L2b <- rexpit(age + 1.5*gender - A1 - A2)
Y2 <- plogis(age - gender + L1a + L1b + A1 + 1.8*A2 + rnorm(n))
data <- data.frame(age, gender, A1, L1a, L1b, Y1, A2, L2a, L2b, Y2)

#Note that gform is not correctly specified in these examples.

#Also show some different ways of specifying the nodes:

result5a <- ltmle(data, Anodes=c(3, 7), Lnodes=c("L1a", "L1b", "L2a", "L2b"), 
 Ynodes=grep("^Y", names(data)), abar=c(1, 0), SL.library=NULL, estimate.time=FALSE, 
 survivalOutcome=FALSE, gform=c("A1 ~ gender", "A2 ~ age")) 
summary(result5a)

#Usually you would specify a Qform for all of the Lnodes and Ynodes but in this case 
# L1a, L1b, Y1 is a "block" of L/Y nodes not separated by Anodes or Cnodes (the same is true for 
# L2a, L2b, Y2). Only one regression is required at the first L/Y node in a block. You can pass 
# regression formulas for the other L/Y nodes, but they'll be ignored.
result5b <- ltmle(data, Anodes=c(3, 7), Lnodes=c("L1a", "L1b", "L2a", "L2b"), 
 Ynodes=grep("^Y", names(data)), abar=c(1, 0), estimate.time=FALSE, survivalOutcome=FALSE, 
 gform=c("A1 ~ gender", "A2 ~ age"), Qform=c(L1a="Q.kplus1 ~ 1", L2a="Q.kplus1 ~ 1"))
summary(result5b)


#Gives the same result but prints a message saying some regression formulas will be dropped:
result5c <- ltmle(data, Anodes=c(3, 7), Lnodes=c("L1a", "L1b", "L2a", "L2b"), 
 Ynodes=grep("^Y", names(data)), abar=c(1, 0), estimate.time=FALSE, survivalOutcome=FALSE, 
 gform=c("A1 ~ gender", "A2 ~ age"), Qform=c(L1a="Q.kplus1 ~ 1", L1b="Q.klus1~A1", 
 Y1="Q.kplus1~L1a", L2a="Q.kplus1 ~ 1", L2b="Q.klus1~A1", Y2="Q.kplus1~A2 + gender"))

summary(result5c)


#If there were a Anode or Cnode between L1b and Y1, Y1 would also need a Q regression formula


# Example 6: MSM
# Given data over 3 time points where A switches to 1 once and then stays 1. We want to know
# how death varies as a function of gender, time and an indicator of whether a patient's 
# intended regime was to switch before time.
# Note that working.msm includes time and switch.time, which are columns of 
# summary.measures; working.msm also includes male, which is ok because it is a baseline
# covariate (it comes before any A/C/L/Y nodes).
data(sampleDataForLtmleMSM)
Anodes <- grep("^A", names(sampleDataForLtmleMSM$data))
Lnodes <- c("CD4_1", "CD4_2")
Ynodes <- grep("^Y", names(sampleDataForLtmleMSM$data))
msm.weights <- matrix(1:12, nrow=4, ncol=3) #just an example (can also use a 200x3x4 array), 
                                            #or NULL (for no weights), or "empirical" (the default)

result6 <- ltmleMSM(sampleDataForLtmleMSM$data, Anodes=Anodes, Lnodes=Lnodes, Ynodes=Ynodes, 
                   survivalOutcome=TRUE,
                   regimes=sampleDataForLtmleMSM$regimes, 
                   summary.measures=sampleDataForLtmleMSM$summary.measures, final.Ynodes=Ynodes, 
                   working.msm="Y ~ male + time + I(pmax(time - switch.time, 0))", 
                   msm.weights=msm.weights, estimate.time=FALSE)
print(summary(result6))


# Example 6.1: regimes can also be specified as a list of rule functions

regimesList <- list(function(row) c(1,1,1),
                     function(row) c(0,1,1),
                     function(row) c(0,0,1),
                     function(row) c(0,0,0))
result.regList <- ltmleMSM(sampleDataForLtmleMSM$data, Anodes=Anodes, Lnodes=Lnodes, Ynodes=Ynodes, 
                   survivalOutcome=TRUE, regimes=regimesList, 
                   summary.measures=sampleDataForLtmleMSM$summary.measures, final.Ynodes=Ynodes, 
                   working.msm="Y ~ male + time + I(pmax(time - switch.time, 0))", 
                   msm.weights=msm.weights, estimate.time=FALSE)
# This should be the same as the above result
print(summary(result.regList))         


# Example 7: variance estimation
# A simple point treatment problem W, A, Y. But there is a positivity problem - 
# for small values of W, Prob(A = 1) is very small.
# The true parameter value, E[Y_1] is approximately 0.697
# The true TMLE standard deviation is approximately 0.064, 
# the true IPTW standard deviation is approximately 0.058.
set.seed(2)
n <- 1000
W <- rnorm(n)
A <- rexpit(8 * W)
Y <- rexpit(W + A)
r1 <- ltmle(data.frame(W, A, Y), Anodes="A", Ynodes="Y", abar = 1, estimate.time=FALSE)
r2 <- ltmle(data.frame(W, A, Y), Anodes="A", Ynodes="Y", abar = 1, estimate.time=FALSE, 
 variance.method="ic")
r3 <- ltmle(data.frame(W, A, Y), Anodes="A", Ynodes="Y", abar = 1, estimate.time=FALSE, 
 variance.method="iptw")
print(summary(r1))
print(summary(r2))
print(summary(r3))
print(summary(r1, estimator="iptw"))
print(summary(r2, estimator="iptw")) #the same - variance.method only affects TMLE
print(summary(r3, estimator="iptw")) #the same - variance.method only affects TMLE
## End(No test)




