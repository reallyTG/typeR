library(Anthropometry)


### Name: plotTreeHipamAnthropom
### Title: HIPAM dendogram
### Aliases: plotTreeHipamAnthropom
### Keywords: array

### ** Examples

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

plotTreeHipamAnthropom(res_hipam[[1]],
                       main=paste("Proposed Hierarchical PAM Clustering \n",
                       "74-78"))



