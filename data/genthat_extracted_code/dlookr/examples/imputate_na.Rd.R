library(dlookr)


### Name: imputate_na
### Title: Imputate Missing values
### Aliases: imputate_na

### ** Examples

## No test: 
# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Replace the missing value of the Income variable with median
imputate_na(carseats, Income, method = "median")

# Replace the missing value of the Income variable with rpart
# The target variable is US.
imputate_na(carseats, Income, US, method = "rpart")

# Replace the missing value of the Urban variable with median
imputate_na(carseats, Urban, method = "mode")

# Replace the missing value of the Urban variable with mice
# The target variable is US.
imputate_na(carseats, Urban, US, method = "mice")

## using dplyr -------------------------------------
library(dplyr)

# The mean before and after the imputation of the Income variable
carseats %>%
  mutate(Income_imp = imputate_na(carseats, Income, US, method = "knn")) %>%
  group_by(US) %>%
  summarise(orig = mean(Income, na.rm = TRUE),
    imputation = mean(Income_imp))

# If the variable of interest is a numarical variable
income <- imputate_na(carseats, Income, US, method = "rpart")
income
summary(income)
plot(income)

# If the variable of interest is a categorical variable
urban <- imputate_na(carseats, Urban, US, method = "mice")
urban
summary(urban)
plot(urban)
## End(No test)



