library(ed50)


### Name: bootIsotonicResample
### Title: The resample function of isotonic regression
### Aliases: bootIsotonicResample

### ** Examples

library(ed50)
pavaData <- preparePava(groupS)
bootIsotonicResample(data = groupS,
                      mle = list(baselinePava = pavaData,
                                    firstDose = 2.5,
                            PROBABILITY.GAMMA = 0.5))



