library(envalysis)


### Name: sorption
### Title: Sorption isotherms
### Aliases: sorption

### ** Examples

sorption(conc = 1:5, c(Kd = 2.5), type = "linear")
sorption(conc = 1:5, c(K = 4, n = 0.6), type = "freundlich")
sorption(conc = 1:5, c(KL = 2, qmax = 10), type = "langmuir")
sorption(conc = 1:5, c(K = 50, qmax = 10, Csat = 10), type = "BET")
sorption(conc = 1:5, c(A = 30, B = 0.8), type = "redlich")




