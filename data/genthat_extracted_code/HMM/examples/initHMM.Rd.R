library(HMM)


### Name: initHMM
### Title: Initialisation of HMM's
### Aliases: initHMM
### Keywords: models

### ** Examples

# Initialise HMM nr.1
initHMM(c("X","Y"), c("a","b","c"))
# Initialise HMM nr.2
initHMM(c("X","Y"), c("a","b"), c(.3,.7), matrix(c(.9,.1,.1,.9),2),
        matrix(c(.3,.7,.7,.3),2))



