library(arulesSequences)


### Name: inspect-methods
### Title: Display Objects
### Aliases: inspect inspect,sequences-method inspect,timedsequences-method
###   inspect,sequencerules-method labels labels,sequences-method
###   labels,timedsequences-method labels,sequencerules-method itemLabels
###   itemLabels,sequences-method itemLabels<-
###   itemLabels<-,sequences-method
### Keywords: print

### ** Examples

## continue example
example(ruleInduction, package = "arulesSequences")

## stacked style
inspect(s2)
inspect(s2, setSep = "->", seqStart = "", seqEnd = "")

## economy style
labels(s2, setSep = "->", seqStart = "", seqEnd = "",
	   itemSep = " ", setStart = "", setEnd = "")

## rules
inspect(r2)

## alternate style
labels(r2, ruleSep = " + ")

## itemset labels
itemLabels(s2, itemsets = TRUE)
itemLabels(s2[reduce = TRUE], itemsets = TRUE)

## item labels
itemLabels(s2) <- tolower(itemLabels(s2))
itemLabels(s2)

## timed
z <- as(zaki, "timedsequences") 
labels(z)
inspect(z)



