library(monotonicity)


### Name: monoUpDown
### Title: Up and Down test
### Aliases: monoUpDown

### ** Examples

## load demo data and apply monoUpDown with daily data, which are not yet in differences
data(demo_returns)
test <- monoUpDown(demo_returns,block_length = 10)



