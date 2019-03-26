library(Blendstat)


### Name: DataCD
### Title: Dataset, peeled cherry coffee.
### Aliases: DataCD
### Keywords: Dataset

### ** Examples

data(DataCD) # dataset

Exp <- DataCD[,2]   # identification of the experiments

X   <- DataCD[,3:6] # independent variables (components)
Y   <- DataCD[,11]  # dependent variable (response Bitterness)
 
# effects o the mixtures in the reference mixture
Effects <- rep(c(-0.1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7),4) 

Conc <- as.matrix(DataCD[,7]) # covariable (process variable)

Res <- Blend(Exp = Exp, X = X, Y = Y, Conc = Conc, Effects = Effects)

print("Predicted and observed values"); Res$MPred
print("Values predicted by components:"); Res$MCPred
print("Design of the experiments:"); Res$MExp
print("Estimates of the linear model parameters:"); Res$Theta 




