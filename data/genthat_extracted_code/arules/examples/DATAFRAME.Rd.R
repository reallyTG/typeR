library(arules)


### Name: DATAFRAME
### Title: Data.frame Representation for arules Objects
### Aliases: DATAFRAME DATAFRAME,rules-method DATAFRAME,itemsets-method
###   DATAFRAME,itemMatrix-method
### Keywords: manip

### ** Examples

data(Adult)
  
DATAFRAME(head(Adult))
DATAFRAME(head(Adult), setStart = '', itemSep = ' + ', setEnd = '')

rules <- apriori(Adult, 
  parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
rules <- head(rules, by = "conf")


### default coercions (same as as(rules, "data.frame"))
DATAFRAME(rules)

DATAFRAME(rules, separate = TRUE)
DATAFRAME(rules, separate = TRUE, setStart = '', itemSep = ' + ', setEnd = '')



