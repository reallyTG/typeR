library(CorrMixed)


### Name: WS.Corr.Mixed.SAS
### Title: Estimate within-subject (test-retest) correlations based on a
###   mixed-effects model using the SAS proc MIXED output.
### Aliases: WS.Corr.Mixed.SAS
### Keywords: Within-subject correlation Test-retest correlation
###   Mixed-effects model Bootstrap SAS Delta-method based CI Reliability

### ** Examples

# Open data 
data(Example.Data)

# Estimate R and Delta method-based CI 
# based on SAS output of fitted Model 2

# First specify asycov matrix
Asy_mat <- matrix(c(129170, -10248, -12.0814, -74.8605,
                    -10248, 25894, 21.0976, -50.1059,
                    -12.0814, 21.0976, 0.07791, 1.2120,
                    -74.8605, -50.1059, 1.212, 370.65), nrow = 4)
Model2_SAS <-  WS.Corr.Mixed.SAS(Model="Model 2", 
D=500.98, Tau2=892.97, Rho=3.6302, Sigma2=190.09, 
Asycov = Asy_mat, Time=c(1:45))                               
summary(Model2_SAS)
plot(Model2_SAS)



