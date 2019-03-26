library(dlookr)


### Name: plot.imputation
### Title: Visualize Information for an "imputation" Object
### Aliases: plot.imputation

### ** Examples

## No test: 
# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Imputate missing values -----------------------------
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

# Imputate outliers ----------------------------------
# If the variable of interest is a numarical variable
price <- imputate_outlier(carseats, Price, method = "capping")
price
summary(price)
plot(price)
## End(No test)



