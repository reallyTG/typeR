library(mediation)


### Name: mediate.ced
### Title: Estimating Average Causal Mediation Effects under the Crossover
###   Encouragement Design
### Aliases: mediate.ced

### ** Examples
 

data(CEDdata)

res <- mediate.ced("Y2", "M1", "M2", "T1", "Z", CEDdata, sims = 100)
summary(res)




