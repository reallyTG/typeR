library(arules)


### Name: combine
### Title: Combining Objects
### Aliases: c c,itemMatrix-method c,transactions-method c,rules-method
###   c,itemsets-method
### Keywords: manip

### ** Examples

data("Adult")

## combine transactions
a1 <- Adult[1:10]
a2 <- Adult[101:110]

aComb <- c(a1, a2)
summary(aComb)

## combine rules (can contain the same rule multiple times)
r1 <- apriori(Adult[1:1000])
r2 <- apriori(Adult[1001:2000])
rComb <- c(r1, r2) 
rComb

## union of rules (a set with only unique rules: same as unique(rComb))
rUnion <- union(r1,r2)
rUnion



