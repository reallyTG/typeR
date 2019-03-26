library(varrank)


### Name: plot.varrank
### Title: Visualization of varrank output
### Aliases: plot.varrank

### ** Examples

library(mlbench)
data(PimaIndiansDiabetes)

##forward search for all variables
out <- varrank(data.df = PimaIndiansDiabetes,
  method = "estevez",
  variable.important = "diabetes",
  discretization.method = "sturges",
  algorithm = "forward",scheme="mid")

##default output
plot(x = out)

##typical plot for high dimensional datasets
plot(x = out, colsep = FALSE, rowsep = FALSE, cellnote = FALSE)




