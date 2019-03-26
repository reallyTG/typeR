library(TropFishR)


### Name: ELEFAN_GA
### Title: ELEFAN_GA
### Aliases: ELEFAN_GA

### ** Examples

## No test: 
# load data and view catch length frequencies
data(synLFQ4)
plot(synLFQ4, Fname="catch")

# Genetic algorithm
# (if using a multicore processor,
#   consider adding the argument 'parallel=TRUE'
#   to reduce computation time)
output <- ELEFAN_GA(synLFQ4, seasonalised = TRUE,
   low_par = list(Linf = 70, K = 0.25, t_anchor = 0, C = 0, ts= 0),
   up_par = list(Linf = 90, K = 0.7, t_anchor = 1, C = 1, ts = 1),
   popSize = 40, maxiter = 50, run = 20,
   MA = 11, plot = TRUE, seed = 1111)
output$par
output$ASP
output$Rn_max

# compare fitness score (fESP) to
# that calculated with "true" growth parameter values
plot(output, draw = FALSE)
lfqFitCurves(output, par=list(Linf=80, K=0.5, t_anchor=0.25, C=0.75, ts=0.5),
       draw = TRUE, col=1, flagging.out = FALSE)$fESP
lfqFitCurves(output, par=output$par, draw = TRUE, col=2, flagging.out = FALSE)$fESP
legend("top", legend=c("orig.", "GA"), lty=2, col=1:2, ncol=2)
## End(No test)




