library(dlookr)


### Name: plot_normality
### Title: Plot distribution information of numerical data
### Aliases: plot_normality plot_normality.data.frame

### ** Examples

## No test: 
# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Visualization of all numerical variables
plot_normality(carseats)

# Select the variable to plot
plot_normality(carseats, Income, Price)
plot_normality(carseats, -Income, -Price)
plot_normality(carseats, 1)

# Using dtplyr::grouped_dt
library(dplyr)

gdata <- group_by(carseats, ShelveLoc, US)
plot_normality(carseats)
plot_normality(carseats, "Sales")

# Using pipes ---------------------------------
# Visualization of all numerical variables
carseats %>%
 plot_normality()

# Positive values select variables
carseats %>%
plot_normality(Income, Price)

# Positions values select variables
carseats %>%
 plot_normality(1)

# Using pipes & dplyr -------------------------
# Plot 'Sales' variable by 'ShelveLoc' and 'US'
carseats %>%
 group_by(ShelveLoc, US) %>%
 plot_normality(Sales)

# extract only those with 'ShelveLoc' variable level is "Good",
# and plot 'Income' by 'US'
carseats %>%
 filter(ShelveLoc == "Good") %>%
 group_by(US) %>%
 plot_normality(Income)
## End(No test)



