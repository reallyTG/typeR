library(TropFishR)


### Name: stock_sim
### Title: Stock simulation
### Aliases: stock_sim
### Keywords: function prediction ypr

### ** Examples

# age-based stock simulation
data(shrimps)

# option 1: without plus group
stock_sim(shrimps, age_unit = "month")

# option 2: with plus group
stock_sim(param = shrimps, age_unit = "month", plus_group = 11)

# length-based stock simulation
data(hake)

stock_sim(param = hake, stock_size_1 = 98919.3)




