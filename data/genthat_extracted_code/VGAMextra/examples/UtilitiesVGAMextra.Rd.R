library(VGAMextra)


### Name: UtilitiesVGAMextra
### Title: Utility Functions for the 'VGAMextra' Package
### Aliases: UtilitiesVGAMextra Is.Numeric is.FormulaAR cross.gammas
###   extract.Residuals fittedVGAMextra weightsVGAMextra WN.lags isNA
###   inspectVGAMextra ffff.help XLMmat

### ** Examples


# Example 1.
myModel1 <- ~ x1 + x2
is.FormulaAR(myModel1)       # TRUE

test <- list( cbind(y1, y2) ~ x1, ~ x2 - 1)
is.FormulaAR(test)          # FALSE
is.FormulaAR(test[[1]], 2)  # TRUE

# Example 2.

x1 <- c(1:3, 4.5, -Inf)
Is.Numeric(x1)                                        # TRUE
Is.Numeric(x1, length.arg = 5)                        # TRUE
Is.Numeric(x1, length.arg = 5, isInteger = TRUE)      # FALSE
Is.Numeric(x1, length.arg = 5, Nnegative = TRUE)      # FALSE

# Example 3. 
# Here, 'cross.gammas' computes Cov(x, y_{t - 1}), Cov(x, y_{t - 2}) and
# Cov(x, y_{t - 3}). 

x <- runif(50)
y <- runif(50)
cross.gammas(x, y, lags = 3)





