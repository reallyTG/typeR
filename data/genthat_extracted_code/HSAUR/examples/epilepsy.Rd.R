library(HSAUR)


### Name: epilepsy
### Title: Epilepsy Data
### Aliases: epilepsy
### Keywords: datasets

### ** Examples


  data("epilepsy", package = "HSAUR")
  library(lattice)
  dotplot(I(seizure.rate / base) ~ period | subject, data = epilepsy, 
          subset = treatment == "Progabide")
  dotplot(I(seizure.rate / base) ~ period | subject, data = epilepsy, 
          subset = treatment == "Progabide")




