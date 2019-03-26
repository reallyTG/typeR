library(fdadensity)


### Name: CreateModeOfVarPlotLQ2D
### Title: Transformation Mode of Variation Plot
### Aliases: CreateModeOfVarPlotLQ2D

### ** Examples

## Densities for Top 50 Male Baby Names
data(Top50BabyNames)
x = Top50BabyNames$x

# Perform Transformation FPCA for male baby name densities
X = FPCAdens(dmatrix = t(Top50BabyNames$dens$male), dSup = Top50BabyNames$x, useAlpha = TRUE, 
                  optns = list(dataType = 'Dense', error = FALSE, methodSelectK = 2))

# Plot Modes

Qvec = quantile(X$xiEst[,1], probs = c(0.1, 0.25, 0.75, 0.9))/sqrt(X$lambda[1])
CreateModeOfVarPlotLQ2D(X, k = 1, dSup = x, Qvec = Qvec, main = 'First Mode, Density Space')
CreateModeOfVarPlotLQ2D(X, domain = 'Q', k = 1, dSup = x, Qvec = Qvec, 
                            main = 'First Mode, LQD space')

Qvec = quantile(X$xiEst[,2], probs = c(0.1, 0.25, 0.75, 0.9))/sqrt(X$lambda[2])
CreateModeOfVarPlotLQ2D(X, k = 2, dSup = x, Qvec = Qvec, main = 'Second Mode, Density Space')
CreateModeOfVarPlotLQ2D(X, domain = 'Q', k = 2, dSup = x, Qvec = Qvec, 
                            main = 'Second Mode, LQD space')




