library(psychometric)


### Name: SpearmanBrown
### Title: Spearman-Brown Prophecy Formulae
### Aliases: SBrel SBlength SpearmanBrown
### Keywords: univar models

### ** Examples

# Given a test with rxx = .7, 10 items
# Desire a test with rxx=.9, how many items are needed?
new.length <- SBlength(.9, .7)
new.length * 10
# 39 items are needed
# what is the reliability of a test 1/2 as long
SBrel(.5, .7)



