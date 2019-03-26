library(IndexNumR)


### Name: evaluateMatched
### Title: Evaluate product overlap between periods
### Aliases: evaluateMatched

### ** Examples

# create CES_sigma_2 dataset removing the observation in time period 4
# on product 1
df <- CES_sigma_2[!(CES_sigma_2$time==4 & CES_sigma_2$prodID==1),]
# evaluate the overlap between periods for this dataset assuming
# a chained index
evaluateMatched(df, pvar="prices", qvar="quantities", pervar="time",
prodID = "prodID", output="chained")



