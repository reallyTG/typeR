library(ndtv)


### Name: transmissionTimeline
### Title: plots network diffusion/transmission tree with generation time
###   vs. clock/model time
### Aliases: transmissionTimeline

### ** Examples

# an edgelist describing an infection tree
el <-cbind(c(16, 13, 13,  10, 13, 16, 10, 13, 1, 10, 8, 1, 4, 4, 2, 2),
            1:16)
# a vector of infection times
infectionTimes <- c(583, 494, 634, 40, 712, 701, 224, 719,  
                   674, 0, 749, 621, 453, 665, 709, 575)
# make a network object, include the infection time                   
infTree<-network(el,vertex.attr = list(infectionTimes),
            vertex.attrnames = list('infectionTimes'))

transmissionTimeline(infTree,time.attr='infectionTimes')





