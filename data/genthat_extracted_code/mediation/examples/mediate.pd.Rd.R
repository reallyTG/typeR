library(mediation)


### Name: mediate.pd
### Title: Estimating Average Causal Mediation Effects under the Parallel
###   Design
### Aliases: mediate.pd

### ** Examples


data(boundsdata)

bound2 <- mediate.pd("out", "med", "ttt", "manip", boundsdata, 
                  NINT = TRUE, sims = 100, conf.level=.95)
summary(bound2)

bound2.1 <- mediate.pd("out", "med", "ttt", "manip", boundsdata, NINT = FALSE)
summary(bound2.1)




