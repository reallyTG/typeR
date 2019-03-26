library(arules)


### Name: subset
### Title: Subsetting Itemsets, Rules and Transactions
### Aliases: subset subset,itemMatrix-method subset,itemsets-method
###   subset,itemMatrix-method subset,rules-method
### Keywords: manip

### ** Examples

data("Adult")
rules <- apriori(Adult)

## select all rules with item "marital-status=Never-married" in 
## the right-hand-side and lift > 2
rules.sub <- subset(rules, subset = rhs %in% "marital-status=Never-married" 
    & lift > 2)

## use partial matching for all items corresponding to the variable
## "marital-status"
rules.sub <- subset(rules, subset = rhs %pin% "marital-status=")

## select only rules with items "age=Young" and "workclass=Private" in
## the left-hand-side
rules.sub <- subset(rules, subset = lhs %ain% 
    c("age=Young", "workclass=Private"))



