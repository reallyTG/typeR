library(dlookr)


### Name: imputate_outlier
### Title: Imputate Outliers
### Aliases: imputate_outlier

### ** Examples

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Replace the missing value of the Price variable with median
imputate_outlier(carseats, Price, method = "median")

# Replace the missing value of the Price variable with rpart
# The target variable is US.
imputate_outlier(carseats, Price, method = "capping")

## using dplyr -------------------------------------
library(dplyr)

# The mean before and after the imputation of the Price variable
carseats %>%
  mutate(Price_imp = imputate_outlier(carseats, Price, method = "capping")) %>%
  group_by(US) %>%
  summarise(orig = mean(Price, na.rm = TRUE),
    imputation = mean(Price_imp, na.rm = TRUE))

# If the variable of interest is a numarical variable
price <- imputate_outlier(carseats, Price)
price
summary(price)
plot(price)



