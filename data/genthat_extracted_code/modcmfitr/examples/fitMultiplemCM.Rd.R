library(modcmfitr)


### Name: fitMultiplemCM
### Title: Fit modified Connor-Mosimann distributions to multiple experts'
###   opinions
### Aliases: fitMultiplemCM
### Keywords: Connor-Mosimann modified

### ** Examples

Quantiles <- c(0.025,0.5,0.975) # to fit median and 95% Credibility Intervals
SearchParams <- c(10000,100) # number of iterations, max number of searches
RawData <- data.frame(expert = as.character(c(1,1,1,2,2,2)),
                      Outcome = as.factor(c("Remission","Progression","Dead",
                                           "Remission","Progression","Dead")),
                      LL = as.numeric(c(0.43, 0.16, 0.03, 0.35, 0.15, 0.00)),
                     MED = as.numeric(c(0.55, 0.27, 0.18, 0.60, 0.30, 0.10)),
                      UL = as.numeric(c(0.65, 0.46, 0.23, 0.70, 0.45, 0.20)))

fitMultiplemCM(Quantiles, SearchParams, RawData)



