library(TropFishR)


### Name: alba
### Title: Length-frequency data of the clam Abra alba
### Aliases: alba
### Keywords: data dataset length-frequency

### ** Examples

data(alba)

# plot raw catch frequencies
plot(alba, Fname = "catch")

# plot restructured frequencies
alba <- lfqRestructure(alba, MA=5)
plot(alba, Fname = "rcounts")

## No test: 
# ELEFAN_SA fitting
set.seed(1)
fitSA <- ELEFAN_SA(
  alba, seasonalised = TRUE,
  init_par = list(Linf=14.5, K=1.1, t_anchor=0.4, ts=0, C=0.2),
  low_par = list(Linf=13, K=0.7, t_anchor=0, ts=0, C=0),
  up_par = list(Linf=15.5, K=1.5, t_anchor=1, ts=1, C=1),
  SA_time = 60
)
unlist(fitSA$par)
fitSA$Rn_max

# plot ELEFAN_SA results
plot(alba, Fname = "catch", draw = FALSE)
lfqFitCurves(fitSA, col=2, par=fitSA$par, draw=TRUE)$Rn_max
## End(No test)




