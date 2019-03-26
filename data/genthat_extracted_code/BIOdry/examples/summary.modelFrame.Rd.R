library(BIOdry)


### Name: summary.modelFrame
### Title: summarize a modelFrame object
### Aliases: summary.modelFrame

### ** Examples

## An object from class \code{summary.lme}.
data(Pchron,Pradii03,envir = environment())
## Tree-ring width fluctuations:
trwf <- modelFrame(Pchron,
                   sc.c = Pradii03,
                   rf.t = 2003,
                   log.t = TRUE)
summary(trwf)



