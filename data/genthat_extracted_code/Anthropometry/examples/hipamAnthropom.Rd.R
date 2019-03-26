library(Anthropometry)


### Name: hipamAnthropom
### Title: HIPAM algorithm for anthropometric data
### Aliases: hipamAnthropom
### Keywords: array

### ** Examples

#FOR THE SIZES DEFINED BY THE EUROPEAN NORMATIVE:
dataHipam <- sampleSpanishSurvey
bust <- dataHipam$bust
bustSizes <- bustSizesStandard(seq(74, 102, 4), seq(107, 131, 6))

type <- "IMO"
maxsplit <- 5 ; orness <- 0.7
ah <- c(23, 28, 20, 25, 25)

set.seed(2013)
numSizes <- 1
res_hipam <- computSizesHipamAnthropom(dataHipam, bust, bustSizes$bustCirc, numSizes,
                                       maxsplit, orness, type, ah, FALSE)

fitmodels <- anthrCases(res_hipam, numSizes)
outliers <- trimmOutl(res_hipam, numSizes)

#FOR ANY OTHER DEFINED SIZE:
set.seed(1900)
rand <- sample(1:600,20)
dataComp <- sampleSpanishSurvey[rand, c(2, 3, 5)]
numVar <- dim(dataComp)[2]

type <- "IMO"
maxsplit <- 5 ; orness <- 0.7
ah <- c(28, 25, 25) 

dataMat <- as.matrix(dataComp)
set.seed(2013)
res_hipam_One <- list() ; class(res_hipam_One) <- "hipamAnthropom" 
res_hipam_One[[1]] <- hipamAnthropom(dataMat, maxsplit = maxsplit, orness = orness, 
                                     type = type, ah = ah, verbose = FALSE)
                            

#plotTreeHipamAnthropom(res_hipam_One, main="Proposed Hierarchical PAM Clustering \n")

fitmodels_One <- anthrCases(res_hipam_One,1)
outliers_One <- trimmOutl(res_hipam_One,1)



