library(arc)


### Name: topRules
### Title: Rule Generation
### Aliases: topRules

### ** Examples

# Example 1
  utils::data(Adult)
  rules <- topRules(Adult, appearance = list(), target_rule_count = 100,
  init_support = 0.5,init_conf = 0.9, minlen = 1, init_maxlen = 10)

# Example 2
  rules <- topRules(as(discrNumeric(datasets::iris, "Species")$Disc.data,"transactions"),
  getAppearance(datasets::iris,"Species"))

# Example 3
  utils::data(datasets::iris)
  appearance <- list(rhs =  c("Species=setosa", "Species=versicolor",
   "Species=virginica"), default="lhs")
  data <- sapply(datasets::iris,as.factor)
  data <- data.frame(data, check.names=FALSE)
  txns <- as(data,"transactions")
  rules <- topRules(txns, appearance)




