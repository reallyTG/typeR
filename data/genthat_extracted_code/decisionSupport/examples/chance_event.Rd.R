library(decisionSupport)


### Name: chance_event
### Title: simulate occurrence of random events
### Aliases: chance_event
### Keywords: ~kwd1 ~kwd2

### ** Examples


chance_event(0.6,6)
 
chance_event(.5,c(0,5),c(5,6))

chance_event(chance=0.5,
             value_if=1,
             value_if_not=5,
             n=10,
             CV_if=20)




