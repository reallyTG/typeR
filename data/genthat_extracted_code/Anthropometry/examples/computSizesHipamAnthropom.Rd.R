library(Anthropometry)


### Name: computSizesHipamAnthropom
### Title: Computation of the hipamAnthropom elements for a given number of
###   sizes defined by the EN
### Aliases: computSizesHipamAnthropom
### Keywords: math

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



