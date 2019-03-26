library(woeBinning)


### Name: germancredit
### Title: German Credit Data
### Aliases: germancredit
### Keywords: data

### ** Examples

# Load German credit data and create subset
data(germancredit)
df <- germancredit[, c('creditability', 'credit.amount', 'duration.in.month',
                  'savings.account.and.bonds', 'purpose')]
# Display structure of the subset (data frame)
str(df)



