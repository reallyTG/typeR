library(scorecard)


### Name: iv
### Title: Information Value
### Aliases: iv

### ** Examples

# Load German credit data
data(germancredit)

# information values
info_value = iv(germancredit, y = "creditability")

str(info_value)




