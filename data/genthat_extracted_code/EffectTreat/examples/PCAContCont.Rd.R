library(EffectTreat)


### Name: PCA.ContCont
### Title: Compute the predictive causal association (PCA) in the
###   Continuous-continuous case
### Aliases: PCA.ContCont
### Keywords: Causal-Inference framework Sensitivity PCA
###   Continuous-continuous setting Univariate setting

### ** Examples

# Based on the example dataset
    # load data in memory
data(Example.Data)
    # compute corr(S, T) in control treatment, gives .77
cor(Example.Data$S[Example.Data$Treat==-1], 
Example.Data$T[Example.Data$Treat==-1])
   # compute corr(S, T) in experimental treatment, gives .71
cor(Example.Data$S[Example.Data$Treat==1], 
Example.Data$T[Example.Data$Treat==1])
   # compute var T in control treatment, gives 263.99 
var(Example.Data$T[Example.Data$Treat==-1])
   # compute var T in experimental treatment, gives 230.64  
var(Example.Data$T[Example.Data$Treat==1])
   # compute var S, gives 163.65   
var(Example.Data$S)

# Generate the vector of PCA.ContCont values using these estimates 
# and the grid of values {-1, -.99, ..., 1} for the correlations
# between T0 and T1:
PCA <- PCA.ContCont(T0S=.77, T1S=.71, T0T0=263.99, T1T1=230.65, 
                    SS=163.65, T0T1=seq(-1, 1, by=.01))

# Examine and plot the vector of generated PCA values:
summary(PCA)
plot(PCA)


# Other example

# Generate the vector of PCA.ContCont values when rho_T0S=.3, rho_T1S=.9, 
# sigma_T0T0=2, sigma_T1T1=2,sigma_SS=2, and  
# the grid of values {-1, -.99, ..., 1} is considered for the correlations
# between T0 and T1:
PCA <- PCA.ContCont(T0S=.3, T1S=.9, T0T0=2, T1T1=2, SS=2, 
T0T1=seq(-1, 1, by=.01))

# Examine and plot the vector of generated PCA values:
summary(PCA)
plot(PCA)

# Obtain the positive definite matrices than can be formed as based on the 
# specified (vectors) of the correlations (these matrices are used to 
# compute the PCA values)
PCA$Pos.Def



