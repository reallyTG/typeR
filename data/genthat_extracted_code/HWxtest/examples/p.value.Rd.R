library(HWxtest)


### Name: p.value
### Title: Extract just the P value(s) from a Hardy-Weinberg test.
### Aliases: p.value

### ** Examples

data(HWcases)
testResults <- hwx.test(HWcases)
p.value(testResults)
p.value(testResults, statName="U")




