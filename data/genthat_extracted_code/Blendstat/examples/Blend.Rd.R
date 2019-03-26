library(Blendstat)


### Name: Blend
### Title: Joint analysis of experiments with mixtures and random effects.
### Aliases: Blend
### Keywords: Joint analysis

### ** Examples

data(DataNAT) # dataset 

Exp <- DataNAT[,2]   # identification of experiments

X   <- DataNAT[,3:6] # independent variable
Y   <- DataNAT[,11]  # dependent variable 
 
# effects of the blends in a reference mixture 
Effects <- rep(c(-0.1,0,0.1,0.2,0.3,0.4,0.5,0.6,0.7),4) 

Conc <- as.matrix(DataNAT[,7]) # covariate (process variable)

Res <- Blend(Exp = Exp, X = X, Y = Y, Conc = Conc, Effects = Effects)

print("Predicted and observed values"); Res$MPred
print("Values predicted by components:"); Res$MCPred
print("Design of the experiments:"); Res$MExp
print("Estimates of the linear model parameters:"); Res$Theta 

Tit <- c("Covariate (process variable)","Variable")

Xlab = "Effects"  # label of the X axis
Ylab = "Predicted values"  # label of the Y axis

Plot.Blend(Res, Titles = Tit, PosLeg = 2, xlabel = Xlab,
           ylabel = Ylab, BoxLeg = TRUE, Color = TRUE,
           Casc = TRUE)




