library(varrank)


### Name: varrank
### Title: Heuristics Tools Based on Mutual Information for Variable
###   Ranking and Feature Selection
### Aliases: varrank

### ** Examples

library(mlbench)
data(PimaIndiansDiabetes)

##forward search for all variables
varrank(data.df = PimaIndiansDiabetes,
  method = "estevez",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "forward", scheme = "mid")

##forward search for 3 variables
varrank(data.df = PimaIndiansDiabetes,
  method = "estevez",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "forward",
  scheme = "mid",
  n.var=3)

##backward search for all variables
varrank(data.df = PimaIndiansDiabetes,
  method = "peng",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "backward",
  scheme = "mid",
  n.var=NULL)




