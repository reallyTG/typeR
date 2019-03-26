library(ERP)


### Name: emfa
### Title: Expectation-Maximization (EM) estimation of a factor model.
### Aliases: emfa

### ** Examples


data(impulsivity)

erpdta = as.matrix(impulsivity[,5:505]) # erpdta contains the whole set of ERP curves  
   
fa = emfa(erpdta,nbf=1) # 1-factor modelling of the ERP curves
fa$Objective            # Final difference between the last two iterations
Semp = var(erpdta)      # Sample estimation of the variance of ERP curves
Sfa = diag(fa$Psi)+tcrossprod(fa$B) # Factorial estimation of the variance 
max(abs(Semp-Sfa))      # Distance between the two estimates 

fa = emfa(erpdta,nbf=20) # 20-factor modelling of the ERP curves in erpdta
fa$Objective             # Final difference between the last two iterations
Semp = var(erpdta)       # Sample estimation of the variance of ERP curves
Sfa = diag(fa$Psi)+tcrossprod(fa$B) # Factorial estimation of the variance 
max(abs(Semp-Sfa))       # Distance between the two estimates




