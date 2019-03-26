library(arules)


### Name: rules-class
### Title: Class rules - A Set of Rules
### Aliases: rules-class rules summary.rules-class
###   show,summary.rules-method coerce,rules,data.frame-method
###   itemInfo,rules-method itemLabels,rules-method
###   itemLabels<-,rules-method nitems,rules-method items,rules-method
###   generatingItemsets generatingItemsets,rules-method
###   labels,rules-method itemLabels,rules-method itemLabels<-,rules-method
###   lhs<-,rules-method lhs,rules-method rhs<-,rules-method
###   rhs,rules-method lhs<- lhs rhs<- rhs summary,rules-method
###   initialize,rules-method
### Keywords: classes

### ** Examples

data("Adult")

## Mine rules.
rules <- apriori(Adult, parameter = list(support = 0.4))

## Select a subset of rules using partial matching on the items 
## in the right-hand-side and a quality measure
rules.sub <- subset(rules, subset = rhs %pin% "sex" & lift > 1.3)

## Display the top 3 support rules
inspect(head(rules.sub, n = 3, by = "support"))

## Display the first 3 rules
inspect(rules.sub[1:3])

## Get labels for the first 3 rules
labels(rules.sub[1:3])
labels(rules.sub[1:3], itemSep = " + ", setStart = "", setEnd="", 
  ruleSep = " ---> ")



