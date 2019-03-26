library(ERSA)


### Name: reorderTerms
### Title: Re-order model terms
### Aliases: reorderTerms pvalOrder bselOrder fselOrder revPredOrd
###   randomPredOrder regsubsetsOrder

### ** Examples

bselOrder(lm(mpg~wt+hp+disp, data=mtcars))
fselOrder(lm(mpg~wt+hp+disp, data=mtcars))
revPredOrd(lm(mpg~wt+hp+disp, data=mtcars))
randomPredOrder(lm(mpg~wt+hp+disp, data=mtcars))
regsubsetsOrder(lm(mpg~wt+hp+disp, data=mtcars))



