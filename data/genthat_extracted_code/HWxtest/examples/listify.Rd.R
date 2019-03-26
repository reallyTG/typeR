library(HWxtest)


### Name: listify
### Title: Convert results of 'hwx.test' to a single list of 'hwtest'
###   objects.
### Aliases: listify

### ** Examples

data(HWcases)
outcome <- hwx.test(HWcases, detail=4, statName="LLR")
listify(outcome, detail=1, statName="U")



