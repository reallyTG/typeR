library(arules)


### Name: APappearance-class
### Title: Class APappearance - Specifying the appearance Argument of
###   Apriori to Implement Rule Templates
### Aliases: APappearance-class APappearance template
###   coerce,list,APappearance-method coerce,NULL,APappearance-method
### Keywords: classes

### ** Examples

data("Adult")

## find only frequent itemsets which do not contain small or large income
is <- apriori(Adult, parameter = list(support= 0.1, target="frequent"), 
  appearance = list(none = c("income=small", "income=large")))
itemFrequency(items(is))["income=small"]
itemFrequency(items(is))["income=large"]

## find itemsets that only contain small or large income, or young age
is <- apriori(Adult, parameter = list(support= 0.1, target="frequent"), 
  appearance = list(items = c("income=small", "income=large", "age=Young")))
inspect(head(is))
  
## find only rules with income-related variables in the right-hand-side.
incomeItems <- grep("^income=", itemLabels(Adult), value = TRUE)
incomeItems
rules <- apriori(Adult, parameter = list(support=0.2, confidence = 0.5), 
  appearance = list(rhs = incomeItems))
inspect(head(rules))

## Note: For more complicated restrictions you have to mine all rules/itemsets and
## then filter the results afterwards.



