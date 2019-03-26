library(RoughSets)


### Name: print.RuleSetRST
### Title: The print function for RST rule sets
### Aliases: print.RuleSetRST

### ** Examples

###########################################################
## Example : Printing of a decision rule set problem
###########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

rules <- RI.LEM2Rules.RST(hiring.data)

rules             # all rules are printed
print(rules, 2)   # only the first two rules are printed

# printing a subset of rules
rules[2:3]



