library(moderndive)


### Name: house_prices
### Title: House Sales in King County, USA
### Aliases: house_prices
### Keywords: datasets

### ** Examples

library(dplyr)
library(ggplot2)

# Create variable log of house price
house_prices <- house_prices %>% 
  mutate(log_price = log(price))
  
# Plot histogram of log of house price
ggplot(house_prices, aes(x = log_price)) +
  geom_histogram()




