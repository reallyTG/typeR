## ----message = FALSE-----------------------------------------------------
library(markovchain)
states <- c("a","b","c","d")
byRow <- TRUE
gen <- matrix(data = c(-1, 1/2, 1/2, 0, 1/4, -1/2, 0, 1/4, 1/6, 0, -1/3, 1/6, 0, 0, 0, 0),
nrow = 4,byrow = byRow, dimnames = list(states,states))
ctmc <- new("ctmc",states = states, byrow = byRow, generator = gen, name = "testctmc")

## ------------------------------------------------------------------------
ExpectedTime(ctmc,1,4)

## ------------------------------------------------------------------------
probabilityatT(ctmc,1)

## ------------------------------------------------------------------------
probabilityatT(ctmc,1,1)

## ------------------------------------------------------------------------
energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                 byrow = byRow, generator = gen, 
                 name = "Molecular Transition Model")    

## ------------------------------------------------------------------------
plot(molecularCTMC)

## ------------------------------------------------------------------------
plot(molecularCTMC,package = "diagram")

## ------------------------------------------------------------------------
states <- c("n","y")
Q <- matrix(c(-1,1,1,-1),nrow = 2,byrow = TRUE,dimnames = list(states,states))
range <- matrix(c(1/52,3/52,1/2,2),nrow = 2,byrow = 2)
name <- "testictmc"
ictmc <- new("ictmc",states = states,Q = Q,range = range,name = name)
impreciseProbabilityatT(ictmc,2,0,1,10^-3,TRUE)

## ------------------------------------------------------------------------
sample <- matrix(c(150,2,1,1,1,200,2,1,2,1,175,1,1,1,1,150),nrow = 4,byrow = TRUE)
sample_rel = rbind((sample/rowSums(sample))[1:dim(sample)[1]-1,],c(rep(0,dim(sample)[1]-1),1)) 
freq2Generator(sample_rel,1)

## ------------------------------------------------------------------------
transMatr <- matrix(c(0,0,0,1,0.5,0.5,0,0,0,0,0.5,0,0,0,0,0,0.2,0.4,0,0,0,0.8,0.6,0,0.5),nrow = 5)
object <- new("markovchain", states=c("a","b","c","d","e"),transitionMatrix=transMatr, name="simpleMc")
committorAB(object,c(5),c(3))

## ------------------------------------------------------------------------
statesNames <- c("a", "b", "c")
testmarkov <- new("markovchain", states = statesNames, transitionMatrix =
matrix(c(0.2, 0.5, 0.3,
0.5, 0.1, 0.4,
0.1, 0.8, 0.1), nrow = 3, byrow = TRUE,
dimnames = list(statesNames, statesNames)
))

## ------------------------------------------------------------------------
firstPassageMultiple(testmarkov,"a",c("b","c"),4)

## ------------------------------------------------------------------------
transMatr<-matrix(c(0.4,0.6,.3,.7),nrow=2,byrow=TRUE)
simpleMc<-new("markovchain", states=c("a","b"),
              transitionMatrix=transMatr, 
              name="simpleMc")   
noofVisitsDist(simpleMc,5,"a")

## ------------------------------------------------------------------------
transMatr<-matrix(c(0.99,0.01,0.01,0.99),nrow=2,byrow=TRUE)
simpleMc<-new("markovchain", states=c("a","b"),
             transitionMatrix=transMatr)
expectedRewards(simpleMc,1,c(0,1))

## ------------------------------------------------------------------------
energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                      1, -1), nrow = 2,
             byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                    byrow = byRow, generator = gen, 
                    name = "Molecular Transition Model")
is.CTMCirreducible(molecularCTMC)

## ------------------------------------------------------------------------
statesName <- c("a", "b")
P <- array(0, dim = c(2, 2, 4), dimnames = list(statesName, statesName))
P[,,1] <- matrix(c(0, 1, 1/3, 2/3), byrow = FALSE, nrow = 2)
P[,,2] <- matrix(c(1/4, 3/4, 0, 1), byrow = FALSE, nrow = 2)
P[,,3] <- matrix(c(1, 0, 1/3, 2/3), byrow = FALSE, nrow = 2)
P[,,4] <- matrix(c(3/4, 1/4, 0, 1), byrow = FALSE, nrow = 2)
Lambda <- c(0.8, 0.2, 0.3, 0.7)
ob <- new("hommc", order = 1, states = statesName, P = P, 
         Lambda = Lambda, byrow = FALSE, name = "FOMMC")

predictHommc(ob,3)

## ------------------------------------------------------------------------
energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                        1, -1), nrow = 2,
             byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                    byrow = byRow, generator = gen, 
                    name = "Molecular Transition Model")
is.TimeReversible(molecularCTMC)

