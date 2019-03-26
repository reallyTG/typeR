library(EffectTreat)


### Name: Predict.Treat.Multivar.ContCont
### Title: Compute the predicted treatment effect on the true endpoint of a
###   patient based on his or her observed vector of pretreatment predictor
###   values in the continuous-continuous setting
### Aliases: Predict.Treat.Multivar.ContCont
### Keywords: Causal-Inference framework Continuous-continuous setting
###   Multivariate setting

### ** Examples

# Specify the covariance matrices to be used 
Sigma_TT = matrix(c(177.870, NA, NA, 162.374), byrow=TRUE, nrow=2)
Sigma_TS = matrix(data = c(-45.140, -109.599, 11.290, -56.542,
-106.897, 20.490), byrow = TRUE, nrow = 2)
Sigma_SS = matrix(data=c(840.564, 73.936, -3.333, 73.936, 357.719,
-30.564, -3.333, -30.564, 95.063), byrow = TRUE, nrow = 3)

# Specify treatment effect (Beta), means of vector S (mu_s), and 
# observed pretreatment variable values for patient (S)
Beta <- -0.9581 # treatment effect
mu_S = matrix(c(66.8149, 84.8393, 25.1939), nrow=3) #means S_1--S_3
S = matrix(c(90, 180, 30), nrow=3) # S_1--S_3 values for a patient

# predict Delta_T based on S
Pred_S <- Predict.Treat.Multivar.ContCont(Sigma_TT=Sigma_TT, Sigma_TS=Sigma_TS,
Sigma_SS=Sigma_SS, Beta=Beta, S=S, mu_S=mu_S, T0T1=seq(-1, 1, by=.01))

# Explore results
summary(Pred_S)
plot(Pred_S)



