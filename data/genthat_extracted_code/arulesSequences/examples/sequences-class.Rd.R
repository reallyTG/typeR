library(arulesSequences)


### Name: sequences-class
### Title: Class "sequences" - Collections of Sequences
### Aliases: sequences-class coerce,sequences,list-method
###   coerce,sequences,data.frame-method coerce,list,sequences-method
###   is.closed,sequences-method is.maximal,sequences-method itemsets
###   itemsets,sequences-method LIST,sequences-method show,sequences-method
###   show,summary.sequences-method summary.sequences-class
###   summary,sequences-method
### Keywords: classes

### ** Examples

## 3 example sequences
x <- list("01" = list(c("A","B"), "C"), 
          "02" = list("C"), 
	  "03" = list("B", "B"))

## coerce
s <- as(x, "sequences")
as(s, "data.frame")

## get reference set
as(itemsets(s), "data.frame")



