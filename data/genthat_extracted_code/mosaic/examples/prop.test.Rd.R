library(mosaic)


### Name: prop.test
### Title: Exact and Approximate Tests for Proportions
### Aliases: prop.test
### Keywords: stats

### ** Examples

# Several ways to get a confidence interval for the proportion of Old Faithful
# eruptions lasting more than 3 minutes.
prop.test( faithful$eruptions > 3 )
prop.test(97,272)
faithful$long <- faithful$eruptions > 3
prop.test( faithful$long )
prop.test( ~long , data = faithful )
prop.test( homeless ~ sex, data = HELPrct )
prop.test( ~ homeless | sex, data = HELPrct )
prop.test( ~ homeless, groups = sex, data = HELPrct )




