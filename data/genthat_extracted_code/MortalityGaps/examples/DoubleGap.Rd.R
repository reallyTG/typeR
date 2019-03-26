library(MortalityGaps)


### Name: DoubleGap
### Title: Fit the DoubleGap Life Expectancy Forecasting Model
### Aliases: DoubleGap

### ** Examples

# Input data ------------------------------------
# Collection of life expectancies for female populations
exF <- MortalityGaps.data$exF
# Life expectancy for male populations
exM <- MortalityGaps.data$exM

# Example 1 ----------------------------------------------
# Fit DG model at age 0 for Australia using data from 1950 to 2014
M0 <- DoubleGap(DF = exF,
                DM = exM,
                age = 0,
                country = "AUS",
                years = 1950:2014)
M0
summary(M0)
ls(M0)

# Forecast life expectancy in Australia until 2030
P0 <- predict(M0, h = 16)
P0
# Plot the results
plot(P0)

## Not run: 
##D # Example 2 ----------------------------------------------
##D # Fit DG model at age 0 for Sweden. Provide details about models.
##D # Reproduce published results in the article.
##D M1 <- DoubleGap(DF = exF, 
##D                 DM = exM, 
##D                 age = 0, 
##D                 country = "SWE", 
##D                 years = 1950:2014, 
##D                 arima.order = c(2, 1, 1), 
##D                 drift = TRUE, 
##D                 tau = 75, 
##D                 A = 86)
##D summary(M1)
##D # Predict model 
##D P1 <- predict(M1, h = 36)
##D plot(P1)
##D 
##D # Example 3 ----------------------------------------------
##D # Fit DG model for USA at age 65.
##D M2 <- DoubleGap(DF = exF, 
##D                 DM = exM, 
##D                 age = 65, 
##D                 country = "USA", 
##D                 years = 1950:2014, 
##D                 arima.order = c(0, 1, 0), 
##D                 drift = FALSE, 
##D                 tau = 15, 
##D                 A = 24)
##D summary(M2)
##D # Predict model 
##D P2 <- predict(M2, h = 36)
##D plot(P2)
## End(Not run)



