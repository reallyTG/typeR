library(BMA)


### Name: predict.bicreg
### Title: Predict function for Bayesian Model Averaging for linear models.
### Aliases: predict.bicreg
### Keywords: regression models

### ** Examples


  library(MASS)

# Example 1

     data(UScrime)

     x <- UScrime[,-16]
     y <- log(UScrime[,16])
     x[,-2]<- log(x[,-2])

     crimeBMA <- bicreg(x, y, strict = FALSE, OR = 20)
     predict( crimeBMA, x)

# Example 2 (Venables and Ripley)

     npkBMA <- bicreg( x = npk[, c("block","N","K")], y=npk$yield)
     predict( npkBMA, newdata = npk)

# Example 2 (Venables and Ripley)

     gasPRbma <- bicreg( x = whiteside[,c("Insul", "Temp")], 
                         y = whiteside$Gas)
     predict( gasPRbma, newdata = whiteside)




