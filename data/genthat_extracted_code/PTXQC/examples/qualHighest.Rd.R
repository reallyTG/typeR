library(PTXQC)


### Name: qualHighest
### Title: Score an empirical density distribution of values, where the
###   best possible distribution is right-skewed.
### Aliases: qualHighest

### ** Examples

 qualHighest(c(0,0,0,16), 4)   ## 1
 qualHighest(c(16,0,0,0), 4)   ## 0 
 qualHighest(c(1,1,1,1), 4)    ## 0.5
 qualHighest(c(0,16,0,0), 4)   ## 1/3
 



