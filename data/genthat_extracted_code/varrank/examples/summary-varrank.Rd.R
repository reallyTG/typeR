library(varrank)


### Name: summary.varrank
### Title: Summary Methods for Varrank Objects
### Aliases: summary.varrank

### ** Examples

library(mlbench)
data(PimaIndiansDiabetes)

##forward search for all variables
varrank.output <- varrank(data.df = PimaIndiansDiabetes,
  method = "peng",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "forward", scheme = "mid")

##Print summary output of varrank object

summary(varrank.output)




