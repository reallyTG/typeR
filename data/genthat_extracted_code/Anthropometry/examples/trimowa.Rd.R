library(Anthropometry)


### Name: trimowa
### Title: Trimmed PAM with OWA operators
### Aliases: trimowa
### Keywords: array

### ** Examples

#FOR THE SIZES DEFINED BY THE EUROPEAN NORMATIVE:
dataTrimowa <- sampleSpanishSurvey
numVar <- dim(dataTrimowa)[2]
bust <- dataTrimowa$bust
bustSizes <- bustSizesStandard(seq(74, 102, 4), seq(107, 131, 6))

orness <- 0.7
weightsTrimowa <- weightsMixtureUB(orness, numVar)

numClust <- 3 ; alpha <- 0.01 ; niter <- 10 ; algSteps <- 7
ah <- c(23, 28, 20, 25, 25)

set.seed(2014)
numSizes <- 2
res_trimowa <- computSizesTrimowa(dataTrimowa, bust, bustSizes$bustCirc, numSizes,
                                  weightsTrimowa, numClust, alpha, niter, algSteps, 
                                  ah, FALSE)
prototypes <- anthrCases(res_trimowa, numSizes)

#FOR ANY OTHER DEFINED SIZE:
set.seed(1900)
rand <- sample(1:600,20)
dataComp <- sampleSpanishSurvey[rand, c(2, 3, 5)]
numVar <- dim(dataComp)[2]

orness <- 0.7
weightsTrimowa <- weightsMixtureUB(orness, numVar)
numClust <- 3 ; alpha <- 0.01 ; niter <- 10 ; algSteps <- 7
ah <- c(28, 25, 25) 

set.seed(2014)
res_trimowa <- trimowa(dataComp, weightsTrimowa, numClust, alpha, niter, 
                            algSteps, ah, verbose = FALSE)
class(res_trimowa) <- "trimowa"
prototypes <- anthrCases(res_trimowa, 1)



