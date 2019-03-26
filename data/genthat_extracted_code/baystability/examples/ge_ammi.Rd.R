library(baystability)


### Name: ge_ammi
### Title: AMMI of Genotype by Environment Interaction Model
### Aliases: ge_ammi ge_ammi.default

### ** Examples


data(cultivo2008)
fm1 <-
   ge_ammi(
      .data  = cultivo2008
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )


data(cultivo2009)
fm2 <-
   ge_ammi(
      .data  = cultivo2009
     , .y    = y
     , .gen  = entry
     , .env  = site
     , .rep  = rep
     )





