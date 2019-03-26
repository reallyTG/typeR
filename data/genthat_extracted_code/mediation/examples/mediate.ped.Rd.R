library(mediation)


### Name: mediate.ped
### Title: Computing Bounds on Average Causal Mediation Effects under the
###   Parallel Encouragement Design
### Aliases: mediate.ped

### ** Examples


data(boundsdata)

bound3 <- mediate.ped("out.enc", "med.enc", "ttt", "enc", boundsdata)
summary(bound3)




