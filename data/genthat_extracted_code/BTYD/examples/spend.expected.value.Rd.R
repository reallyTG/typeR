library(BTYD)


### Name: spend.expected.value
### Title: Conditional expected transaction value
### Aliases: spend.expected.value

### ** Examples

params <- c(6, 4, 16)
# calculate the expected transaction value of a customer
# who spent an average of $35 over 3 transactions.
spend.expected.value(params, m.x=35, x=3)

# m.x and x may be vectors:
spend.expected.value(params, m.x=30:40, x=3)
spend.expected.value(params, m.x=35, x=1:10)
spend.expected.value(params, m.x=30:40, x=1:11)



