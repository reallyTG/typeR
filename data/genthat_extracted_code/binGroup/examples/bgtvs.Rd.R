library(binGroup)


### Name: bgtvs
### Title: Confidence Interval for One Proportion in Group Testing with
###   Variable Group Sizes
### Aliases: bgtvs
### Keywords: htest

### ** Examples

# Consider a very simple example,
# given in Hepworth (1996), table 5:
# 2 groups each containing 5 units,
# and 3 groups, each containing 2 units

# In the first setting (n=2, s=5) y=1 positive group 
# has been observed, in the second setting (n=3, s=2),
# y=2 positive have been observed.

bgtvs(n=c(2,3), s=c(5,2), y=c(1,2)) 

###############################################

# Recalculate the example given in
# Hepworth (1996), table 5:

 bgtvs(n=c(2,3), s=c(5,2), y=c(0,0))
 bgtvs(n=c(2,3), s=c(5,2), y=c(0,1))
 bgtvs(n=c(2,3), s=c(5,2), y=c(0,2))
 bgtvs(n=c(2,3), s=c(5,2), y=c(0,3))
 bgtvs(n=c(2,3), s=c(5,2), y=c(1,0))
 bgtvs(n=c(2,3), s=c(5,2), y=c(1,1))
 bgtvs(n=c(2,3), s=c(5,2), y=c(1,2))
 bgtvs(n=c(2,3), s=c(5,2), y=c(1,3))
 bgtvs(n=c(2,3), s=c(5,2), y=c(2,0))
 bgtvs(n=c(2,3), s=c(5,2), y=c(2,1))
 bgtvs(n=c(2,3), s=c(5,2), y=c(2,2))
 bgtvs(n=c(2,3), s=c(5,2), y=c(2,3))




