library(dejaVu)


### Name: SimulateComplete
### Title: Simulate a complete data set
### Aliases: SimulateComplete

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
                        event.rates=c(0.01,0.005),dispersions=0.25)
sim2 <- SimulateComplete(study.time=365,number.subjects=c(50,75),
                        event.rates=c(0.01,0.005),dispersions=c(0,0.25))



