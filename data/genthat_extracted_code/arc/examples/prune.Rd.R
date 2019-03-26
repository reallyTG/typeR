library(arc)


### Name: prune
### Title: Classifier Builder
### Aliases: prune

### ** Examples

 #Example 1
  txns <- as(discrNumeric(datasets::iris, "Species")$Disc.data,"transactions")
  appearance <- getAppearance(datasets::iris,"Species")
  rules <- apriori(txns, parameter = list(confidence = 0.5,
  support= 0.01, minlen= 2, maxlen= 4),appearance = appearance)
  prune(rules,txns, appearance$rhs)
  inspect(rules)

#Example 2
 utils::data(Adult) # this dataset comes with the arules package
 classitems <- c("income=small","income=large")
 rules <- apriori(Adult, parameter = list(supp = 0.3, conf = 0.5,
 target = "rules"), appearance=list(rhs=classitems, default="lhs"))
 # produces 1266 rules
 rules <- prune(rules,Adult,classitems)
 # Rules after data coverage pruning: 198
 # Performing default rule pruning.
 # Final rule list size:  174



