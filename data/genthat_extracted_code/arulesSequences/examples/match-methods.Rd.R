library(arulesSequences)


### Name: match-methods
### Title: Match Objects
### Aliases: match match,sequences,sequences-method
###   %in%,sequences,sequences-method
###   match,sequencerules,sequencerules-method
###   %in%,sequences,character-method %in% %ain%,sequences,character-method
###   %ain% %pin%,sequences,character-method %pin%
###   %ein%,sequences,character-method %ein% duplicated,sequences-method
###   duplicated,sequencerules-method duplicated
### Keywords: manip

### ** Examples

## continue example
example(cspade)

## match
labels(s1[match(s2, s1)])
labels(s1[s1 %in% s2])	    # the same

## match items
labels(s2[s2 %in%  c("B", "F")])
labels(s2[s2 %ain% c("B", "F")])
labels(s2[s2 %pin% "F"])

## match itemsets
labels(s1[s1 %ein% c("F","B")])



