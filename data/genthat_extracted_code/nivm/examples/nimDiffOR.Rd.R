library(nivm)


### Name: nimDiffOR
### Title: Variable margin functions
### Aliases: nimDiffOR nimDiff nimOR
### Keywords: misc

### ** Examples

## notice that the second values, F1(t)=0.20=q, 
## all equal 
##  q+delta=0.30
nimDiff(c(1:9)/10)
nimOR(c(1:9)/10)
nimDiffOR(c(1:9)/10)
## for delta<0, take max of difference and odds ratio
nimDiffOR(c(1:9)/10,delta=-.1)




