library(varrank)


### Name: print.varrank
### Title: Methods for Varrank Objects
### Aliases: print.varrank

### ** Examples

library(mlbench)
data(PimaIndiansDiabetes)

##forward search for all variables
varrank.output <- varrank(data.df = PimaIndiansDiabetes,
  method = "peng",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "forward", scheme = "mid")

##Print varrank output

varrank.output



