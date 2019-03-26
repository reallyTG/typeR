library(Mediana)


### Name: MultAdjProc
### Title: MultAdjProc object
### Aliases: MultAdjProc

### ** Examples

# Parameters of the chain procedure (fixed-sequence procedure)
# Vector of hypothesis weights
chain.weight = c(1, 0)
# Matrix of transition parameters
chain.transition = matrix(c(0, 1,
                            0, 0), 2, 2, byrow = TRUE)

# Analysis model
analysis.model = AnalysisModel() +
  MultAdjProc(proc = "ChainAdj",
              par = parameters(weight = chain.weight,
                               transition = chain.transition)) +
  Test(id = "PFS test",
       samples = samples("Plac PFS", "Treat PFS"),
       method = "LogrankTest") +
  Test(id = "OS test",
       samples = samples("Plac OS", "Treat OS"),
       method = "LogrankTest")



