library(arulesSequences)


### Name: sequencerules-class
### Title: Class "sequencerules" - Collections of Sequential Rules
### Aliases: sequencerules-class coerce,sequencerules,list-method
###   coerce,sequencerules,data.frame-method
###   coerce,sequencerules,sequences-method generatingItemsets
###   coverage,sequencerules-method
###   coverage,sequencerules,ANY,missing-method
###   is.redundant,sequencerules-method summary,sequencerules-method
###   show,sequencerules-method show,summary.sequencerules-method
###   summary.sequencerules-class summary,sequencerules-method
### Keywords: classes

### ** Examples

## continue example
example(ruleInduction, package = "arulesSequences")
cbind(as(r2, "data.frame"), 
      coverage = coverage(r2))

## coerce to sequences
as(as(r2, "sequences"), "data.frame")

## find redundant rules
is.redundant(r2, measure = "lift")



