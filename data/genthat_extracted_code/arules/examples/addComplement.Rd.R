library(arules)


### Name: addComplement
### Title: Add Complement-items to Transactions
### Aliases: addComplement addComplement,transactions-method
### Keywords: manip

### ** Examples

data("Groceries")

## add a complement-items for "whole milk" and "other vegetables"
g2 <- addComplement(Groceries, c("whole milk", "other vegetables"))
inspect(head(g2, 3))

## use a custom label for the complement-item
g2 <- addComplement(g2, "coffee", "NO coffee")
inspect(head(g2, 3))



