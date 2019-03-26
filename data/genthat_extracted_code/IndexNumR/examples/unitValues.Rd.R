library(IndexNumR)


### Name: unitValues
### Title: Aggregates prices to unit values and quantities to sums
### Aliases: unitValues

### ** Examples

# suppose the CES_sigma_2 dataset contains 12 monthly observations
# and suppose we want quarterly unit values.
df <- CES_sigma_2
# convert the monthly time variable into quarterly
df$time <- ceiling(CES_sigma_2$time/3)
# compute unit values using the quarterly time variable
unitValues(df,pvar="prices",qvar="quantities",pervar="time",prodID="prodID")



