library(bayesammi)


### Name: ge_ammi
### Title: AMMI of Genotype by Environment Interaction Model
### Aliases: ge_ammi ge_ammi.default

### ** Examples


data(Maiz)
fm1 <-
   ge_ammi(
      .data  = Maiz
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )







