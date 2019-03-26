library(cointReg)


### Name: checkDoptions
### Title: Check list D.options.
### Aliases: checkDoptions

### ** Examples

checkDoptions(n.lag = 3, n.lead = 4)
checkDoptions(info.crit = "BIC")
checkDoptions()

# It's not sufficient to include only one of "n.lag" and "n.lead":
checkDoptions(n.lag = 2)




