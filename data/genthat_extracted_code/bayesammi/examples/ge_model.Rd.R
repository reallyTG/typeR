library(bayesammi)


### Name: ge_model
### Title: Genotype by Environment Interaction Model
### Aliases: ge_model ge_model.default

### ** Examples


data(Maiz)
fm1 <-
   ge_model(
      .data  = Maiz
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )





