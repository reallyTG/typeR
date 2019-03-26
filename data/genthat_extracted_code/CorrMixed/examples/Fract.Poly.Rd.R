library(CorrMixed)


### Name: Fract.Poly
### Title: Fit fractional polynomials
### Aliases: Fract.Poly
### Keywords: Fractional polynomials

### ** Examples

# Open data
data(Example.Data)

# Fit fractional polynomials, mox. order = 3
FP <- Fract.Poly(Covariate = Time, Outcome = Outcome, 
Dataset = Example.Data, Max.M=3)

# Explore results
summary(FP)
# best fitting model (based on AIC) for m=3, 
# powers:  p_{1}=3,  p_{2}=3, and  p_{3}=2

# Fit model and compare with observed means

    # plot of mean 
Spaghetti.Plot(Dataset = Example.Data, Outcome = Outcome,
Time = Time, Id=Id, Add.Profiles = FALSE, Lwd.Me=1, 
ylab="Mean Outcome")

    # Coding of predictors (note that when p_{1}=p_{2},
    # beta_{1}*X ** {p_{1}} + beta_{2}*X ** {p_{1}} * log(X)
    #  and when p=0, X ** {0}= log(X)    )
term1 <- Example.Data$Time**3
term2 <- (Example.Data$Time**3) * log(Example.Data$Time) 
term3 <- Example.Data$Time**2 

    # fit model
Model <- lm(Outcome~term1+term2+term3, data=Example.Data)
Model$coef # regression weights (beta's)  

    # make prediction for time 1 to 47
term1 <- (1:47)**3 
term2 <- ((1:47)**3) * log(1:47)   
term3 <- (1:47)**2 
    # compute predicted values
pred <- Model$coef[1] + (Model$coef[2] * term1) + 
  (Model$coef[3] * term2) + (Model$coef[4] * term3)
   # Add predicted values to plot
lines(x = 1:47, y=pred,  lty=2)
legend("topright", c("Observed", "Predicted"), lty=c(1, 2))



