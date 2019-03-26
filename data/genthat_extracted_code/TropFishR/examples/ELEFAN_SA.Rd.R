library(TropFishR)


### Name: ELEFAN_SA
### Title: ELEFAN_SA
### Aliases: ELEFAN_SA

### ** Examples

## No test: 
## synthetic lfq data example
data(synLFQ4)
plot(synLFQ4, Fname="catch")

# ELEFAN_SA (takes approximately 2 minutes)
output <- ELEFAN_SA(synLFQ4, SA_time = 60*2, seasonalised = TRUE, MA = 11,
  init_par = list(Linf = 75, K = 0.5, t_anchor = 0.5, C = 0.5, ts = 0.5),
  low_par = list(Linf = 70, K = 0.3, t_anchor = 0, C = 0, ts = 0),
  up_par = list(Linf = 90, K = 0.7, t_anchor = 1, C = 1, ts = 1))
output$par
output$Rn_max

# view fit
plot(output)

# or
plot(output, draw = FALSE)
lfqFitCurves(output, col=1, par=output$par, draw=TRUE)$ESP

# compare to original parameters
tmp <- lfqFitCurves(output, col=4, lty=1,
   par=list(Linf=80, K=0.5, t_anchor=0.25, C=0.75, ts=0.5), draw=TRUE)
tmp$fESP
output$Rn_max
## End(No test)




