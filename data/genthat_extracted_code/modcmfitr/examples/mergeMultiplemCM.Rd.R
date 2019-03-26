library(modcmfitr)


### Name: mergeMultiplemCM
### Title: Merge multiple modified Connor-Mosimann distributions together
### Aliases: mergeMultiplemCM
### Keywords: Connor-Mosimann modified

### ** Examples

NrSamples <- 100000
RawData <- data.frame(expert = as.character(c(1,1,1,2,2,2)),
                      Outcome = as.factor(c("Remission","Progression","Dead",
                                           "Remission","Progression","Dead")),
                      a = as.numeric(c(6.0786, 0.2245, 0, 6.9214, 4.5259, 0)),
                      b = as.numeric(c(7.5900, 0.5866, 0, 1.7187, 3.1892, 0)),
                      L = as.numeric(c(0.3400, 0.4839, 0, 0.0152, 0.2390, 0)),
                      U = as.numeric(c(0.7917, 0.9213, 0, 0.7106, 0.9970, 0)))
mergeMultiplemCM(NrSamples,RawData)



