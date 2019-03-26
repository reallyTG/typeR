library(EWGoF)


### Name: EDF_NS.test
### Title: GoF tests based on the empirical distribution function, the
###   normalized spacings and the probability plots for the Exponential
###   distribution
### Aliases: EDF_NS.test
### Keywords: Empirical distribution function Gini Gndenko Shapiro-Wilk
###   Patwardhan

### ** Examples


x1 <- rexp(50,2)

#Apply the Kolmogorov-Smirnov test 
EDF_NS.test(x1,type="KS")

x2 <- rlnorm(50,0.2)

#Apply the Patwardhan test 
EDF_NS.test(x2,type="PA")

#Apply the Cramer-von Mises test 
EDF_NS.test(x2,type="CM")

#Apply the Gini test  
EDF_NS.test(x2,type="G")




