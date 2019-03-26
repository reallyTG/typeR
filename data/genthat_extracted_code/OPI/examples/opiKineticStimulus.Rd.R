library(OPI)


### Name: opiKineticStimulus
### Title: Stimulus parameter list.
### Aliases: opiKineticStimulus
### Keywords: misc

### ** Examples

    # A Size III white kinetic stimuli on
    # a bilinear path {(27,27), (15,20), (0,0)} 
stim <- list(path=list(x=c(27,15,0), y=c(27,20,0)),
                sizes=rep(0.43,2), 
                colors=rep("white",2), 
                levels=rep(318,2), 
                speeds=c(4,3))
class(stim) <- "opiKineticStimulus"



