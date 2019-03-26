library(popbio)


### Name: vitalsim
### Title: Calculate stochastic growth rate and extinction time CDF using
###   vital rates with within-year, auto-, and cross-correlations
### Aliases: vitalsim
### Keywords: survey

### ** Examples

## load vital rates and correlation matrices
data(hudvrs)
data(hudcorrs)
## set vrtypes
hudvrtypes <- c(rep(1,13), rep(3,5), rep(1,6))

## run Full model- using 100 runs here for speed
full <- vitalsim(hudvrs$mean, hudvrs$var, hudcorrs$corrin,
 hudcorrs$corrout, hudmxdef, vrtypes=hudvrtypes,
 n0=c(4264,3,30,16,25,5), yrspan=20 , runs=100)
## deterministic and stochastic lambda
full[1:2]
## log stochastic lambda
log(full$stochLambda)
sd(full$logLambdas)

## SKIP the next two simulations- however, sample output is included for plotting
#NO between year correlations so corrout = diag(0,13)  - all zeros
# no.between <- vitalsim(hudvrs$mean, hudvrs$var, hudcorrs$corrin,
# diag(0,13), hudmxdef, vrtypes=hudvrtypes,
# n0=c(4264,3,30,16,25,5), yrspan=20 )
no.between <- list(CDFExt=c(rep(0,40),0.01,0.04,0.12,0.15,
0.20,0.31,0.49,0.58,0.72,0.78))

#NO correlations so corrout = diag(0,13) AND corrin=diag(13) - ones on diagonal
# no.corr<-vitalsim(hudvrs$mean, hudvrs$var, diag(13),
# diag(0,13), hudmxdef, vrtypes=hudvrtypes,
# n0=c(4264,3,30,16,25,5), yrspan=20 )
no.corr <- list(CDFExt=c(rep(0,39),0.03,0.03,0.06,0.12,0.20,
0.30,0.42,0.52,0.65,0.76,0.83))

## Figure 8.3 with corrected correlation matrices for full model
matplot(cbind(a=full$CDFExt, no.between$CDFExt, no.corr$CDFExt), type='l',
 ylim=c(0,1), lty=1:3, col=2:4, lwd=2, las=1,
 xlab="Years into the future", ylab="Cumulative probability of quasi-extinction")
legend(2,1, c("Full model", "No between-year correlations", "No correlations"),
 lty=1:3, col=2:4, lwd=2)



