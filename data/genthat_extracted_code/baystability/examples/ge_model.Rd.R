library(baystability)


### Name: ge_model
### Title: Genotype by Environment Interaction Model
### Aliases: ge_model ge_model.default

### ** Examples


data(cultivo2008)
fm1 <-
   ge_model(
      .data  = cultivo2008
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )





