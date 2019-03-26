library(genalg)


### Name: rbga.bin
### Title: R Based Genetic Algorithm (binary chromosome)
### Aliases: rbga.bin
### Keywords: multivariate

### ** Examples

# a very simplistic optimization
evaluate <- function(string=c()) {
    returnVal = 1 / sum(string);
    returnVal
}

rbga.results = rbga.bin(size=10, mutationChance=0.01, zeroToOneRatio=0.5,
    evalFunc=evaluate)

plot(rbga.results)

# in this example the four variables in the IRIS data 
# set are complemented with 36 random variables. 
# Variable selection should find the four original
# variables back (example by Ron Wehrens).
## Not run: 
##D data(iris)
##D library(MASS)
##D X <- cbind(scale(iris[,1:4]), matrix(rnorm(36*150), 150, 36))
##D Y <- iris[,5]
##D 
##D iris.evaluate <- function(indices) {
##D   result = 1
##D   if (sum(indices) > 2) {
##D     huhn <- lda(X[,indices==1], Y, CV=TRUE)$posterior
##D     result = sum(Y != dimnames(huhn)[[2]][apply(huhn, 1,
##D                function(x)
##D                which(x == max(x)))]) / length(Y)
##D   }
##D   result
##D }
##D 
##D monitor <- function(obj) {
##D     minEval = min(obj$evaluations);
##D     plot(obj, type="hist");
##D }
##D 
##D woppa <- rbga.bin(size=40, mutationChance=0.05, zeroToOneRatio=10,
##D   evalFunc=iris.evaluate, verbose=TRUE, monitorFunc=monitor)
## End(Not run)

# another realistic example: wavelenght selection for PLS on NIR data
## Not run: 
##D library(pls.pcr)
##D data(NIR)
##D 
##D numberOfWavelenghts = ncol(NIR$Xtrain)
##D evaluateNIR <- function(chromosome=c()) {
##D     returnVal = 100
##D     minLV = 2
##D     if (sum(chromosome) < minLV) {
##D         returnVal
##D     } else {
##D         xtrain = NIR$Xtrain[,chromosome == 1];
##D         pls.model = pls(xtrain, NIR$Ytrain, validation="CV", grpsize=1, 
##D                         ncomp=2:min(10,sum(chromosome)))
##D         returnVal = pls.model$val$RMS[pls.model$val$nLV-(minLV-1)]
##D         returnVal
##D     }
##D }
##D 
##D monitor <- function(obj) {
##D     minEval = min(obj$evaluations);
##D     filter = obj$evaluations == minEval;
##D     bestObjectCount = sum(rep(1, obj$popSize)[filter]);
##D     # ok, deal with the situation that more than one object is best
##D     if (bestObjectCount > 1) {
##D         bestSolution = obj$population[filter,][1,];
##D     } else {
##D         bestSolution = obj$population[filter,];
##D     }
##D     outputBest = paste(obj$iter, " #selected=", sum(bestSolution),
##D                        " Best (Error=", minEval, "): ", sep="");
##D     for (var in 1:length(bestSolution)) {
##D         outputBest = paste(outputBest,
##D             bestSolution[var], " ",
##D             sep="");
##D     }
##D     outputBest = paste(outputBest, "\n", sep="");
##D 
##D     cat(outputBest);
##D }
##D 
##D nir.results = rbga.bin(size=numberOfWavelenghts, zeroToOneRatio=10, 
##D     evalFunc=evaluateNIR, monitorFunc=monitor,
##D     popSize=200, iters=100, verbose=TRUE)
## End(Not run)



