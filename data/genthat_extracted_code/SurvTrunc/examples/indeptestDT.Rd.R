library(SurvTrunc)


### Name: indeptestDT
### Title: Testing quasi-independence between survival and truncation times
### Aliases: indeptestDT

### ** Examples

# Generating independent survival and truncation times
set.seed(123)
y=rnorm(30); l=min(y)-abs(rnorm(30)); r=max(y)+abs(rnorm(30))

indeptestDT(y,l,r)

# Null hypothesis not rejected ==> not enough evidence to reject quasi-independence assumption



