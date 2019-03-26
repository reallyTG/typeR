rm(list = ls())
library(MortalityGaps)

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

# Forecast life expectancy in Australia until 2050
P0 <- predict(M0, h = 36)
P0
# Plot the results
plot(P0)


# Example 2 ----------------------------------------------
# Fit DG model at age 0 for Sweden. Provide details about models.
# Reproduce published results in the article.
M1 <- DoubleGap(DF = exF, 
                DM = exM, 
                age = 0, 
                country = "SWE", 
                years = 1950:2014, 
                arima.order = c(2, 1, 1), 
                drift = TRUE, 
                tau = 75, 
                A = 86)
summary(M1)
# Predict model 
P1 <- predict(M1, h = 36)
plot(P1)

# Example 3 ----------------------------------------------
# Fit DG model for USA at age 65.
M2 <- DoubleGap(DF = exF, 
                DM = exM, 
                age = 65, 
                country = "USA", 
                years = 1950:2014, 
                arima.order = c(0, 1, 0), 
                drift = FALSE, 
                tau = 15, 
                A = 24)
summary(M2)
# Predict model 
P2 <- predict(M2, h = 36)
plot(P2)


### ---------------------------------------------- ###
# TESTS

testDGMFit <- function(M){
  test_that("Test model fitting",{
    expect_s3_class(M, "DoubleGap")
    expect_output(print(M))
    expect_output(print(summary(M)))
    expect_warning(print(M), regexp = NA) # Expect no warning
    expect_warning(summary(M), regexp = NA)
    expect_true(all(fitted(M)[-c(1:2), 4:8] >= 0))
    expect_false(all(is.na(coef(M)$bp_model)))
    expect_false(all(is.na(coef(M)$sex_gap_model)))
    expect_false(all(is.na(resid(M0)[-c(1:2), ]))) # we have a lag=2, so we will have some NA's on the first 2 row
    expect_identical(dim(fitted(M)), dim(resid(M)))
  })
}

for (i in 0:2) testDGMFit(get(paste0("M", i)))


testDGMPred <- function(P){
  test_that("Test model prediction", {
    expect_s3_class(P, "predict.DoubleGap")
    expect_output(print(P))
    expect_false(any(is.na(P$pred.values)))
    expect_true(all(P$pred.values[, 4:8] >= 0))
  })
}


for (i in 0:2) testDGMPred(get(paste0("P", i)))

# Check that the print function for data is working
expect_output(print(MortalityGaps.data))








