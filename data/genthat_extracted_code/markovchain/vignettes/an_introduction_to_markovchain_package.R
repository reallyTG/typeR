### R code from vignette source 'an_introduction_to_markovchain_package.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: setup
###################################################
	options(prompt = "R> ", continue = "+  ", 
			width = 70, useFancyQuotes = FALSE)
	set.seed(123)


###################################################
### code chunk number 2: load
###################################################
library("markovchain")


###################################################
### code chunk number 3: showClass
###################################################
showClass("markovchain")
showClass("markovchainList")


###################################################
### code chunk number 4: mcInitLong
###################################################
weatherStates <- c("sunny", "cloudy", "rain")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.70, 0.2, 0.1,
                       0.3, 0.4, 0.3,
                       0.2, 0.45, 0.35), byrow = byRow, nrow = 3,
                     dimnames = list(weatherStates, weatherStates))
mcWeather <- new("markovchain", states = weatherStates, byrow = byRow, 
               transitionMatrix = weatherMatrix, name = "Weather")


###################################################
### code chunk number 5: mcInitLong
###################################################
mcWeather <- new("markovchain", states = c("sunny", "cloudy", "rain"),
                 transitionMatrix = matrix(data = c(0.70, 0.2, 0.1,
                       0.3, 0.4, 0.3,
                       0.2, 0.45, 0.35), byrow = byRow, nrow = 3), 
                 name = "Weather")


###################################################
### code chunk number 6: defaultMc
###################################################
defaultMc <- new("markovchain")


###################################################
### code chunk number 7: intromcList
###################################################
mcList <- new("markovchainList", markovchains = list(mcWeather, defaultMc), 
		name = "A list of Markov chains")


###################################################
### code chunk number 8: operations
###################################################
initialState <- c(0, 1, 0)
after2Days <- initialState * (mcWeather * mcWeather)
after7Days <- initialState * (mcWeather ^ 7)
after2Days
round(after7Days, 3)


###################################################
### code chunk number 9: operations2
###################################################
initialState <- c(0, 1, 0)
after2Days <- (t(mcWeather) * t(mcWeather)) * initialState
after7Days <- (t(mcWeather) ^ 7) * initialState
after2Days
round(after7Days, 3)


###################################################
### code chunk number 10: fval
###################################################
fvals<-function(mchain,initialstate,n) {
  out<-data.frame()
  names(initialstate)<-names(mchain)
  for (i in 0:n)
  {
    iteration<-initialstate*mchain^(i)
    out<-rbind(out,iteration)
  }
  out<-cbind(out, i=seq(0,n))
  out<-out[,c(4,1:3)]
  return(out)
}
fvals(mchain=mcWeather,initialstate=c(90,5,5),n=4)


###################################################
### code chunk number 11: otherMethods
###################################################
states(mcWeather)
names(mcWeather)
dim(mcWeather)


###################################################
### code chunk number 12: otherMethods
###################################################
name(mcWeather)
name(mcWeather) <- "New Name"
name(mcWeather)


###################################################
### code chunk number 13: sortMethod
###################################################
markovchain:::sort(mcWeather)


###################################################
### code chunk number 14: transProb
###################################################
transitionProbability(mcWeather, "cloudy", "rain")
mcWeather[2,3]


###################################################
### code chunk number 15: printAndShow
###################################################
print(mcWeather)
show(mcWeather)


###################################################
### code chunk number 16: mcPlot
###################################################
library("igraph")
plot(mcWeather,layout = layout.fruchterman.reingold,main="Weather transition matrix")


###################################################
### code chunk number 17: mcPlotdiagram
###################################################
plot(mcWeather, package="diagram", box.size = 0.04)


###################################################
### code chunk number 18: exportImport1
###################################################
mcDf <- as(mcWeather, "data.frame")
mcNew <- as(mcDf, "markovchain")
mcDf
mcIgraph <- as(mcWeather, "igraph")


###################################################
### code chunk number 19: exporImport2
###################################################
require(msm)
Q <- rbind ( c(0, 0.25, 0, 0.25),
             c(0.166, 0, 0.166, 0.166),
             c(0, 0.25, 0, 0.25),
             c(0, 0, 0, 0) )
cavmsm <- msm(state ~ years, subject = PTNUM, data = cav, qmatrix = Q, death = 4)
msmMc <- as(cavmsm, "markovchain")
msmMc


###################################################
### code chunk number 20: exporImport3
###################################################
library(etm)
data(sir.cont)
sir.cont <- sir.cont[order(sir.cont$id, sir.cont$time), ]
for (i in 2:nrow(sir.cont)) {
  if (sir.cont$id[i]==sir.cont$id[i-1]) {
    if (sir.cont$time[i]==sir.cont$time[i-1]) {
      sir.cont$time[i-1] <- sir.cont$time[i-1] - 0.5
    }
  }
}
tra <- matrix(ncol=3,nrow=3,FALSE)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE
tr.prob <- etm(sir.cont, c("0", "1", "2"), tra, "cens", 1)
tr.prob
etm2mc<-as(tr.prob, "markovchain")
etm2mc


###################################################
### code chunk number 21: importExportPlot
###################################################
library(igraph)
importExportGraph<-graph.formula(dataframe++markovchain,markovchain-+igraph,
                                 markovchain++matrix,table-+markovchain,msm-+markovchain,etm-+markovchain,
                                 markovchain++sparseMatrix)
plot(importExportGraph,main="Import - Export from and to markovchain objects")


###################################################
### code chunk number 22: exportImport2
###################################################
myMatr<-matrix(c(.1,.8,.1,.2,.6,.2,.3,.4,.3), byrow=TRUE, ncol=3)
myMc<-as(myMatr, "markovchain")
myMc


###################################################
### code chunk number 23: cchcMcList
###################################################
stateNames = c("H", "I", "D")
Q0 <- new("markovchain", states = stateNames, 
        transitionMatrix =matrix(c(0.7, 0.2, 0.1,0.1, 0.6, 0.3,0, 0, 1), 
        byrow = TRUE, nrow = 3), name = "state t0")
Q1 <- new("markovchain", states = stateNames, 
        transitionMatrix = matrix(c(0.5, 0.3, 0.2,0, 0.4, 0.6,0, 0, 1), 
        byrow = TRUE, nrow = 3), name = "state t1")
Q2 <- new("markovchain", states = stateNames, 
        transitionMatrix = matrix(c(0.3, 0.2, 0.5,0, 0.2, 0.8,0, 0, 1), 
        byrow = TRUE,nrow = 3), name = "state t2")
Q3 <- new("markovchain", states = stateNames, 
          transitionMatrix = matrix(c(0, 0, 1, 0, 0, 1, 0, 0, 1), 
        byrow = TRUE, nrow = 3), name = "state t3")
mcCCRC <- new("markovchainList",markovchains = list(Q0,Q1,Q2,Q3), 
      name = "Continuous Care Health Community")
print(mcCCRC)


###################################################
### code chunk number 24: cchcMcList2
###################################################
mcCCRC[[1]]
dim(mcCCRC)


###################################################
### code chunk number 25: conditionalDistr
###################################################
conditionalDistribution(mcWeather, "sunny")


###################################################
### code chunk number 26: steadyStates
###################################################
steadyStates(mcWeather)


###################################################
### code chunk number 27: gamblerRuin
###################################################
gamblerRuinMarkovChain <- function(moneyMax, prob = 0.5) {
  require(matlab)
  matr <- zeros(moneyMax + 1)
  states <- as.character(seq(from = 0, to = moneyMax, by = 1))
  rownames(matr) = states; colnames(matr) = states
  matr[1,1] = 1; matr[moneyMax + 1,moneyMax + 1] = 1
  for(i in 2:moneyMax)
  { matr[i,i-1] = 1 - prob; matr[i, i + 1] = prob   }
  out <- new("markovchain",  
           transitionMatrix = matr, 
           name = paste("Gambler ruin", moneyMax, "dim", sep = " ")
           )
  return(out)
}

mcGR4 <- gamblerRuinMarkovChain(moneyMax = 4, prob = 0.5)
steadyStates(mcGR4)


###################################################
### code chunk number 28: absorbingStates
###################################################
absorbingStates(mcGR4)
absorbingStates(mcWeather)


###################################################
### code chunk number 29: commclassKernel
###################################################
.commclassesKernel <- function(P){
  m <- ncol(P)
	stateNames <- rownames(P)
	T <- zeros(m) 
	i <- 1
	while (i <= m) { 
		a <- i 
		b <- zeros(1,m)
		b[1,i] <- 1
		old <- 1
		new <- 0
		while (old != new) {
			old <- sum(find(b > 0))
			n <- size(a)[2]
			matr <- matrix(as.numeric(P[a,]), ncol = m, 
                     nrow = n)
			c <- colSums(matr)
			d <- find(c)
			n <- size(d)[2]
			b[1,d] <- ones(1,n)
			new <- sum(find(b>0))
			a <- d
		}
		T[i,] <- b
		i <- i+1 }
	F <- t(T)  
	C <- (T > 0)&(F > 0)
	v <- (apply(t(C) == t(T), 2, sum) == m)
	colnames(C) <- stateNames
	rownames(C) <- stateNames
	names(v) <- stateNames
	out <- list(C = C, v = v)
	return(out)
}


###################################################
### code chunk number 30: renaldoMatrix1
###################################################
P <- matlab::zeros(10)
P[1, c(1, 3)] <- 1/2;
P[2, 2] <- 1/3; P[2,7] <- 2/3;
P[3, 1] <- 1;
P[4, 5] <- 1;
P[5, c(4, 5, 9)] <- 1/3;
P[6, 6] <- 1;
P[7, 7] <- 1/4; P[7,9] <- 3/4;
P[8, c(3, 4, 8, 10)] <- 1/4;
P[9, 2] <- 1;
P[10, c(2, 5, 10)] <- 1/3;
rownames(P) <- letters[1:10] 
colnames(P) <- letters[1:10]
probMc <- new("markovchain", transitionMatrix = P, 
              name = "Probability MC")
.commclassesKernel(P)
summary(probMc)


###################################################
### code chunk number 31: transientStates
###################################################
transientStates(probMc)


###################################################
### code chunk number 32: probMc2Canonic
###################################################
probMcCanonic <- canonicForm(probMc)
probMc
probMcCanonic


###################################################
### code chunk number 33: isAccessible
###################################################
is.accessible(object = probMc, from = "a", to = "c")
is.accessible(object = probMc, from = "g", to = "c")


###################################################
### code chunk number 34: periodicity
###################################################

E <- matrix(0, nrow = 4, ncol = 4)
E[1, 2] <- 1
E[2, 1] <- 1/3; E[2, 3] <- 2/3
E[3,2] <- 1/4; E[3, 4] <- 3/4
E[4, 3] <- 1

mcE <- new("markovchain", states = c("a", "b", "c", "d"), 
		transitionMatrix = E, 
		name = "E")
is.irreducible(mcE)
period(mcE)


###################################################
### code chunk number 35: mathematica9Mc
###################################################
require(matlab)
mathematicaMatr <- zeros(5)
mathematicaMatr[1,] <- c(0, 1/3, 0, 2/3, 0)
mathematicaMatr[2,] <- c(1/2, 0, 0, 0, 1/2)
mathematicaMatr[3,] <- c(0, 0, 1/2, 1/2, 0)
mathematicaMatr[4,] <- c(0, 0, 1/2, 1/2, 0)
mathematicaMatr[5,] <- c(0, 0, 0, 0, 1)
statesNames <- letters[1:5]
mathematicaMc <- new("markovchain", transitionMatrix = mathematicaMatr,
                   name = "Mathematica MC", states = statesNames)


###################################################
### code chunk number 36: mathematica9McFig
###################################################
plot(mathematicaMc, layout = layout.fruchterman.reingold)


###################################################
### code chunk number 37: mathematica9MC
###################################################
summary(mathematicaMc)


###################################################
### code chunk number 38: fpTime1 (eval = FALSE)
###################################################
## .firstpassageKernel <- function(P, i, n){
##   G <- P
##   H <- P[i,]
##   E <- 1 - diag(size(P)[2])
##   for (m in 2:n) {
##     G <- P %*% (G * E)
##     H <- rbind(H, G[i,])
##   }
##   return(H)
## }


###################################################
### code chunk number 39: fpTime2
###################################################
firstPassagePdF <- firstPassage(object = mcWeather, state = "sunny", 
                                n = 10)
firstPassagePdF[3, 3]


###################################################
### code chunk number 40: simulatingAMarkovChain
###################################################
weathersOfDays <- rmarkovchain(n = 365, object = mcWeather, t0 = "sunny")
weathersOfDays[1:30]


###################################################
### code chunk number 41: simulatingAListOfMarkovChain
###################################################
patientStates <- rmarkovchain(n = 5, object = mcCCRC, t0 = "H", 
                              include.t0 = TRUE)
patientStates[1:10,]


###################################################
### code chunk number 42: fitMcbyMLE
###################################################
weatherFittedMLE <- markovchainFit(data = weathersOfDays, method = "mle",name = "Weather MLE")
weatherFittedMLE$estimate
weatherFittedMLE$standardError


###################################################
### code chunk number 43: fitMcbyLAPLACE
###################################################
weatherFittedLAPLACE <- markovchainFit(data = weathersOfDays, 
                                    method = "laplace", laplacian = 0.01,
                                    name = "Weather LAPLACE")
weatherFittedLAPLACE$estimate


###################################################
### code chunk number 44: fitSequenceMatrix
###################################################
createSequenceMatrix(stringchar = weathersOfDays)


###################################################
### code chunk number 45: fitSequenceMatrix2
###################################################
myMatr<-matrix(c("a","b","b","a","a","b","b","b","b","a","a","a","b","a"),ncol=2)
createSequenceMatrix(stringchar = myMatr,toRowProbs = TRUE)


###################################################
### code chunk number 46: fitMcbyBootStrap
###################################################
weatherFittedBOOT <- markovchainFit(data = weathersOfDays, 
                                    method = "bootstrap", nboot = 20)
weatherFittedBOOT$estimate
weatherFittedBOOT$standardError


###################################################
### code chunk number 47: fitMcbyBootStrap (eval = FALSE)
###################################################
## weatherFittedBOOTParallel <- markovchainFit(data = weathersOfDays, 
##                                     method = "bootstrap", nboot = 200, 
##                                     parallel = TRUE)
## weatherFittedBOOTParallel$estimate
## weatherFittedBOOTParallel$standardError


###################################################
### code chunk number 48: fitMcbyBootStrap (eval = FALSE)
###################################################
## RcppParallel::setNumThreads(2)


###################################################
### code chunk number 49: fitMcbyMLE
###################################################
weatherFittedMLE$logLikelihood
weatherFittedBOOT$logLikelihood


###################################################
### code chunk number 50: confint
###################################################
weatherFittedMLE$confidenceInterval
weatherFittedBOOT$confidenceInterval


###################################################
### code chunk number 51: multinomial
###################################################
multinomialConfidenceIntervals(transitionMatrix = 
        weatherFittedMLE$estimate@transitionMatrix, 
        countsTransitionMatrix = createSequenceMatrix(weathersOfDays))


###################################################
### code chunk number 52: fitMclists
###################################################
data(holson)
singleMc<-markovchainFit(data=holson[,2:12],name="holson")


###################################################
### code chunk number 53: fitMclistsFit
###################################################
mcListFit<-markovchainListFit(data=holson[,2:6],name="holson")
mcListFit$estimate


###################################################
### code chunk number 54: fitMclistsFit
###################################################
c1<-c("a","b","a","a","c","c","a")
c2<-c("b")
c3<-c("c","a","a","c")
c4<-c("b","a","b","a","a","c","b")
c5<-c("a","a","c",NA)
c6<-c("b","c","b","c","a")
mylist<-list(c1,c2,c3,c4,c5,c6)
mylistMc<-markovchainFit(data=mylist)
mylistMc


###################################################
### code chunk number 55: fitAMarkovChainListfromAlist
###################################################
markovchainListFit(data=mylist)


###################################################
### code chunk number 56: markovchainPredict
###################################################
predict(object = weatherFittedMLE$estimate, newdata = c("cloudy", "sunny"),
        n.ahead = 3)


###################################################
### code chunk number 57: markovchainListPredict
###################################################
predict(mcCCRC, newdata = c("H", "H"), n.ahead = 5)


###################################################
### code chunk number 58: markovchainListPredict2
###################################################
predict(mcCCRC, newdata = c("H", "H"), n.ahead = 5, continue = TRUE)


###################################################
### code chunk number 59: test1
###################################################

sample_sequence<-c("a", "b", "a", "a", "a", "a", "b", "a", "b", "a", 
            "b", "a", "a", "b", "b", "b", "a")
verifyMarkovProperty(sample_sequence)


###################################################
### code chunk number 60: test2
###################################################
data(rain)
assessOrder(rain$rain)


###################################################
### code chunk number 61: test3
###################################################
assessStationarity(rain$rain, 10)


###################################################
### code chunk number 62: divergence2
###################################################
sequence<-c(0,1,2,2,1,0,0,0,0,0,0,1,2,2,2,1,0,0,1,0,0,0,0,0,0,1,1,
2,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,2,1,0,
0,2,1,0,0,0,0,0,0,1,1,1,2,2,0,0,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,0,2,
0,1,1,0,0,0,1,2,2,0,0,0,0,0,0,2,2,2,1,1,1,1,0,1,1,1,1,0,0,2,1,1,
0,0,0,0,0,2,2,1,1,1,1,1,2,1,2,0,0,0,1,2,2,2,0,0,0,1,1)
mc=matrix(c(5/8,1/4,1/8,1/4,1/2,1/4,1/4,3/8,3/8),byrow=TRUE, nrow=3)
rownames(mc)<-colnames(mc)<-0:2; theoreticalMc<-as(mc, "markovchain")
verifyEmpiricalToTheoretical(data=sequence,object=theoreticalMc)


###################################################
### code chunk number 63: divergence2
###################################################
data(kullback)
verifyHomogeneity(inputList=kullback,verbose=TRUE)


###################################################
### code chunk number 64: rCtmcInit
###################################################
energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                 byrow = byRow, generator = gen, 
                 name = "Molecular Transition Model")      


###################################################
### code chunk number 65: rctmcRandom0
###################################################
statesDist <- c(0.8, 0.2)
rctmc(n = 3, ctmc = molecularCTMC, initDist = statesDist, out.type = "df", include.T0 = FALSE)


###################################################
### code chunk number 66: ctmcRandom1
###################################################
statesDist <- c(0.8, 0.2)
rctmc(n = Inf, ctmc = molecularCTMC, initDist = statesDist, T = 2)


###################################################
### code chunk number 67: rctmcSteadyStates
###################################################
steadyStates(molecularCTMC)


###################################################
### code chunk number 68: rctmcFitting
###################################################
data <- list(c("a", "b", "c", "a", "b", "a", "c", "b", "c"), 
             c(0, 0.8, 2.1, 2.4, 4, 5, 5.9, 8.2, 9))
ctmcFit(data)


###################################################
### code chunk number 69: mcWeatherQ
###################################################
mcWeatherQ <- expm::logm(mcWeather@transitionMatrix,method='Eigen')
mcWeatherQ


###################################################
### code chunk number 70: mcWeatherHalfDay
###################################################
mcWeatherHalfDayTM <- expm::expm(mcWeatherQ*.5)
mcWeatherHalfDay <- new("markovchain",transitionMatrix=mcWeatherHalfDayTM,name="Half Day Weather Transition Matrix")
mcWeatherHalfDay


###################################################
### code chunk number 71: ctmcd1
###################################################
require(ctmcd)
require(expm)
#defines a function to transform a GM into a TM
gm_to_markovchain<-function(object, t=1) {
  if(!(class(object) %in% c("gm","matrix","Matrix")))
    stop("Error! Expecting either a matrix or a gm object")
  if ( class(object) %in% c("matrix","Matrix")) generator_matrix<-object else generator_matrix<-as.matrix(object[["par"]])
  #must add importClassesFrom("markovchain",markovchain) in the NAMESPACE
  #must add importFrom(expm, "expm")
  transitionMatrix<-expm(generator_matrix*t)
  out<-as(transitionMatrix,"markovchain")
  return(out)
}
#loading ctmcd dataset
data(tm_abs)
gm0=matrix(1,8,8) #initializing
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0
gmem=gm(tm_abs,te=1,method="EM",gmguess=gm0) #estimating GM
mc_at_2=gm_to_markovchain(object=gmem, t=2) #converting to TM at time 2


###################################################
### code chunk number 72: pseudobayes
###################################################

pseudoBayesEstimator <- function(raw, apriori){
  v_i <- rowSums(raw) 
  K_i <- numeric(nrow(raw))
  sumSquaredY <- rowSums(raw^2)
  #get numerator
  K_i_num <- v_i^2-sumSquaredY
  #get denominator
  VQ <- matrix(0,nrow= nrow(apriori),ncol=ncol(apriori))
  for (i in 1:nrow(VQ)) {
    VQ[i,]<-v_i[i]*apriori[i,]
  }
  
  K_i_den<-rowSums((raw - VQ)^2)
  
  K_i <- K_i_num/K_i_den
  
  #get the alpha vector
  alpha <- K_i / (v_i+K_i)
  
  #empirical transition matrix
  Emp<-raw/rowSums(raw)
  
  #get the estimate
  out<-matrix(0, nrow= nrow(raw),ncol=ncol(raw))
  for (i in 1:nrow(out)) {
    out[i,]<-alpha[i]*apriori[i,]+(1-alpha[i])*Emp[i,]
  }
  return(out)
}


###################################################
### code chunk number 73: pseudobayes2
###################################################

trueMc<-as(matrix(c(0.1, .9,.7,.3),nrow = 2, byrow = 2),"markovchain")
aprioriMc<-as(matrix(c(0.5, .5,.5,.5),nrow = 2, byrow = 2),"markovchain")

smallSample<-rmarkovchain(n=20,object = trueMc)
smallSampleRawTransitions<-createSequenceMatrix(stringchar = smallSample)
pseudoBayesEstimator(raw = smallSampleRawTransitions,apriori = aprioriMc@transitionMatrix)-trueMc@transitionMatrix

biggerSample<-rmarkovchain(n=100,object = trueMc)
biggerSampleRawTransitions<-createSequenceMatrix(stringchar = biggerSample)
pseudoBayesEstimator(raw = biggerSampleRawTransitions,apriori = aprioriMc@transitionMatrix)-trueMc@transitionMatrix

bigSample<-rmarkovchain(n=1000,object = trueMc)
bigSampleRawTransitions<-createSequenceMatrix(stringchar = bigSample)
pseudoBayesEstimator(raw = bigSampleRawTransitions,apriori = aprioriMc@transitionMatrix)-trueMc@transitionMatrix




###################################################
### code chunk number 74: loadAndDoExample
###################################################

weatherStates <- c("sunny", "cloudy", "rain")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.7, 0.2, 0.1, 
                                 0.3, 0.4, 0.3, 
                                 0.2, 0.4, 0.4), 
                        byrow = byRow, nrow = 3, 
                        dimnames = list(weatherStates, weatherStates))
mcWeather <- new("markovchain", states = weatherStates, 
                 byrow = byRow, transitionMatrix = weatherMatrix, 
                 name = "Weather")      
weathersOfDays <- rmarkovchain(n = 365, object = mcWeather, t0 = "sunny")


###################################################
### code chunk number 75: MAPFit
###################################################
hyperMatrix<-matrix(c(1, 1, 2, 
                      3, 2, 1,
                      2, 2, 3), 
                    nrow = 3, byrow = TRUE,
                    dimnames = list(weatherStates,weatherStates))
markovchainFit(weathersOfDays[1:200], method = "map", 
               confidencelevel = 0.92, hyperparam = hyperMatrix)
predictiveDistribution(weathersOfDays[1:200], 
                       weathersOfDays[201:365],hyperparam = hyperMatrix)


###################################################
### code chunk number 76: MAPFit2
###################################################
hyperMatrix2<- hyperMatrix[c(2,3,1), c(2,3,1)]
markovchainFit(weathersOfDays[1:200], method = "map", 
               confidencelevel = 0.92, hyperparam = hyperMatrix2)
predictiveDistribution(weathersOfDays[1:200], 
                       weathersOfDays[201:365],hyperparam = hyperMatrix2)



###################################################
### code chunk number 77: inferHyperparam
###################################################
inferHyperparam(transMatr = weatherMatrix, scale = c(10, 10, 10))


###################################################
### code chunk number 78: inferHyperparam2
###################################################
inferHyperparam(data = weathersOfDays[1:15])


###################################################
### code chunk number 79: inferHyperparam3
###################################################
hyperMatrix3 <- inferHyperparam(transMatr = weatherMatrix, scale = c(10, 10, 10))
hyperMatrix3 <- hyperMatrix3$scaledInference
hyperMatrix4 <- inferHyperparam(data = weathersOfDays[1:15])
hyperMatrix4 <- hyperMatrix4$dataInference


###################################################
### code chunk number 80: MAPandMLE
###################################################
data(preproglucacon)
preproglucacon <- preproglucacon[[2]]
MLEest <- markovchainFit(preproglucacon, method = "mle")
MAPest <- markovchainFit(preproglucacon, method = "map")
MLEest$estimate
MAPest$estimate


###################################################
### code chunk number 81: weatPred1
###################################################

mcWP <- new("markovchain", states = c("rainy", "nice", "snowy"),
         transitionMatrix = matrix(c(0.5, 0.25, 0.25,
                                   0.5, 0, 0.5,
                                   0.25,0.25,0.5), byrow = T, nrow = 3))


###################################################
### code chunk number 82: weatPred2
###################################################
W0 <- t(as.matrix(c(0, 1, 0)))
W1 <- W0 * mcWP; W1

W2 <- W0 * (mcWP ^ 2); W2

W3 <- W0 * (mcWP ^ 3); W3


###################################################
### code chunk number 83: weatPred3
###################################################
W7 <- W0 * (mcWP ^ 7)
W7


###################################################
### code chunk number 84: weatPred4
###################################################
q <- steadyStates(mcWP)
q


###################################################
### code chunk number 85: weatPred5
###################################################
R0 <- t(as.matrix(c(1, 0, 0)))
R7 <- R0 * (mcWP ^ 7); R7

S0 <- t(as.matrix(c(0, 0, 1)))
S7 <- S0 * (mcWP ^ 7); S7


###################################################
### code chunk number 86: Alofi1
###################################################
data("rain", package = "markovchain")
table(rain$rain)


###################################################
### code chunk number 87: Alofi2
###################################################
mcAlofi <- markovchainFit(data = rain$rain, name = "Alofi MC")$estimate
mcAlofi


###################################################
### code chunk number 88: Alofi3
###################################################
steadyStates(mcAlofi)


###################################################
### code chunk number 89: ratings1
###################################################

rc <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC", "D")
creditMatrix <- matrix(c(90.81, 8.33, 0.68, 0.06, 0.08, 0.02, 0.01, 0.01,
0.70, 90.65, 7.79, 0.64, 0.06, 0.13, 0.02, 0.01,
0.09, 2.27, 91.05, 5.52, 0.74, 0.26, 0.01, 0.06,
0.02, 0.33, 5.95, 85.93, 5.30, 1.17, 1.12, 0.18,
0.03, 0.14, 0.67, 7.73, 80.53, 8.84, 1.00, 1.06,
0.01, 0.11, 0.24, 0.43, 6.48, 83.46, 4.07, 5.20,
0.21, 0, 0.22, 1.30, 2.38, 11.24, 64.86, 19.79,
0, 0, 0, 0, 0, 0, 0, 100
)/100, 8, 8, dimnames = list(rc, rc), byrow = TRUE)


###################################################
### code chunk number 90: ratings2
###################################################
creditMc <- new("markovchain", transitionMatrix = creditMatrix, 
                name = "S&P Matrix")
absorbingStates(creditMc)


###################################################
### code chunk number 91: economicAnalysis1
###################################################
statesNames <- c("customer", "non customer")
P <- zeros(2); P[1, 1] <- .9; P[1, 2] <- .1; P[2, 2] <- .95; P[2, 1] <- .05;
rownames(P) <- statesNames; colnames(P) <- statesNames
mcP <- new("markovchain", transitionMatrix = P, name = "Telephone company")
M <- zeros(2); M[1, 1] <- -20; M[1, 2] <- -30; M[2, 1] <- -40; M[2, 2] <- 0


###################################################
### code chunk number 92: economicAnalysis2
###################################################
c1 <- 100 + conditionalDistribution(mcP, state = "customer") %*% M[1,]
c2 <- 0 + conditionalDistribution(mcP, state = "non customer") %*% M[2,]


###################################################
### code chunk number 93: economicAnalysis3
###################################################
as.numeric((c(1, 0)* mcP ^ 5) %*% (as.vector(c(c1, c2))))


###################################################
### code chunk number 94: bonusMalus1
###################################################

getBonusMalusMarkovChain <- function(lambda)
{
	bmMatr <- zeros(5)
	bmMatr[1, 1] <- dpois(x = 0, lambda)
	bmMatr[1, 3] <- dpois(x = 1, lambda)
	bmMatr[1, 5] <- 1 - ppois(q = 1, lambda)
	
	bmMatr[2, 1] <- dpois(x = 0, lambda)
	bmMatr[2, 4] <- dpois(x = 1, lambda)
	bmMatr[2, 5] <- 1 - ppois(q = 1, lambda)
	
	bmMatr[3, 2] <- dpois(x = 0, lambda)
	bmMatr[3, 5] <- 1 - dpois(x=0, lambda)
 
	bmMatr[4, 3] <- dpois(x = 0, lambda)
	bmMatr[4, 5] <- 1 - dpois(x = 0, lambda)
  
	bmMatr[5, 4] <- dpois(x = 0, lambda)
	bmMatr[5, 5] <- 1 - dpois(x = 0, lambda)
	stateNames <- as.character(1:5)
	out <- new("markovchain", transitionMatrix = bmMatr, 
             states = stateNames, name = "BM Matrix")
	return(out)
}



###################################################
### code chunk number 95: bonusMalus2
###################################################
bmMc <- getBonusMalusMarkovChain(0.05)
as.numeric(steadyStates(bmMc))


###################################################
### code chunk number 96: bonusMalus3
###################################################
sum(as.numeric(steadyStates(bmMc)) * c(0.5, 0.7, 0.9, 1, 1.25))


###################################################
### code chunk number 97: healthIns6
###################################################
ltcDemoPath<-system.file("extdata", "ltdItaData.txt", package = "markovchain")
ltcDemo<-read.table(file = ltcDemoPath, header=TRUE, sep=";",dec = ".")
head(ltcDemo)


###################################################
### code chunk number 98: healthIns7
###################################################
ltcDemo<-transform(ltcDemo,
                   pIA=0,
                   pII=1-pID,
                   pDD=1,
                   pDA=0,
                   pDI=0)


###################################################
### code chunk number 99: healthIns8
###################################################
possibleStates<-c("A","I","D")
getMc4Age<-function(age) {
  transitionsAtAge<-ltcDemo[ltcDemo$age==age,]
  
  myTransMatr<-matrix(0, nrow=3,ncol = 3,dimnames = list(possibleStates,possibleStates))
  myTransMatr[1,1]<-transitionsAtAge$pAA[1]
  myTransMatr[1,2]<-transitionsAtAge$pAI[1]
  myTransMatr[1,3]<-transitionsAtAge$pAD[1]
  myTransMatr[2,2]<-transitionsAtAge$pII[1]
  myTransMatr[2,3]<-transitionsAtAge$pID[1]
  myTransMatr[3,3]<-1
  
  myMc<-new("markovchain",transitionMatrix=myTransMatr,states=possibleStates,name=paste("Age",age,"transition matrix"))
  
  return(myMc)

}


###################################################
### code chunk number 100: healthIns8
###################################################
getFullTransitionTable<-function(age){
  ageSequence<-seq(from=age, to=120)
  k=1
  myList=list()
  for ( i in ageSequence) {
    mc_age_i<-getMc4Age(age = i)
    myList[[k]]<-mc_age_i
    k=k+1
  }
  myMarkovChainList<-new("markovchainList",markovchains=myList,name=paste("TransitionsSinceAge",age,sep=""))
  return(myMarkovChainList)
}
transitionsSince100<-getFullTransitionTable(age=100)


###################################################
### code chunk number 101: healthIns9
###################################################
rmarkovchain(n=10, object=transitionsSince100,what="matrix",t0="A",include.t0=TRUE)


###################################################
### code chunk number 102: healthIns10
###################################################
transitionsSince80<-getFullTransitionTable(age=80)
lifeTrajectories<-rmarkovchain(n=1e3, object=transitionsSince80,what="matrix",t0="A",include.t0=TRUE)
temp<-matrix(0,nrow=nrow(lifeTrajectories),ncol = ncol(lifeTrajectories))
temp[lifeTrajectories=="I"]<-1
expected_period_disabled<-mean(rowSums((temp)))
expected_period_disabled


###################################################
### code chunk number 103: healthIns11
###################################################
mean(rowMeans(12000*temp%*%( matrix((1+0.02)^-seq(from=0, to=ncol(temp)-1)))))


###################################################
### code chunk number 104: blandenEtAlii
###################################################
data("blanden")
mobilityMc <- as(blanden, "markovchain")
mobilityMc


###################################################
### code chunk number 105: blandenEtAlii2
###################################################
plot(mobilityMc, main = '1970 mobility',vertex.label.cex = 2,
		layout = layout.fruchterman.reingold)


###################################################
### code chunk number 106: blandenEtAlii3
###################################################
round(steadyStates(mobilityMc), 2)


###################################################
### code chunk number 107: preproglucacon1
###################################################
data("preproglucacon", package = "markovchain")


###################################################
### code chunk number 108: preproglucacon2
###################################################
mcProtein <- markovchainFit(preproglucacon$preproglucacon, 
                          name = "Preproglucacon MC")$estimate
mcProtein


###################################################
### code chunk number 109: epid1
###################################################
craigSendiMatr <- matrix(c(682, 33, 25,
              154, 64, 47,
              19, 19, 43), byrow = T, nrow = 3)
hivStates <- c("0-49", "50-74", "75-UP")
rownames(craigSendiMatr) <- hivStates
colnames(craigSendiMatr) <- hivStates
craigSendiTable <- as.table(craigSendiMatr)
mcM6 <- as(craigSendiTable, "markovchain")
mcM6@name <- "Zero-Six month CD4 cells transition"
mcM6


###################################################
### code chunk number 110: epid2
###################################################
eig <- eigen(mcM6@transitionMatrix)
D <- diag(eig$values)


###################################################
### code chunk number 111: epid3
###################################################
V <- eig$vectors 
V %*% D %*% solve(V)
d <- D ^ (1/6)
M <- V %*% d %*% solve(V)
mcM1 <- new("markovchain", transitionMatrix = M, states = hivStates)


