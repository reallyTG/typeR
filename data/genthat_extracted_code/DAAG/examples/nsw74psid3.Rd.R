library(DAAG)


### Name: nsw74psid3
### Title: Labour Training Evaluation Data
### Aliases: nsw74psid3
### Keywords: datasets

### ** Examples

print("Contingency Tables - Example 4.4")
table(nsw74psid3$trt, nsw74psid3$nodeg)
chisq.test(table(nsw74psid3$trt,nsw74psid3$nodeg))



