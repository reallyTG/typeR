library(arules)


### Name: inspect
### Title: Display Associations and Transactions in Readable Form
### Aliases: inspect inspect,itemMatrix-method inspect,itemsets-method
###   inspect,rules-method inspect,transactions-method
### Keywords: print

### ** Examples

data("Adult")
rules <- apriori(Adult)
inspect(rules[1000])

inspect(rules[1000], ruleSep = "---->", itemSep = " + ", setStart = "", setEnd ="", 
  linebreak = FALSE)



