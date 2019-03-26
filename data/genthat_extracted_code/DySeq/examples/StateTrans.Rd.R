library(DySeq)


### Name: StateTrans
### Title: StateTrans
### Aliases: StateTrans

### ** Examples


# Example 1: Sequences from couples cope

data(CouplesCope)
my.s<-StateExpand(CouplesCope, 2:49, 50:97)

# First sequence is dependend variable 
# - what behavior preceeds stress signals?
StateTrans(my.s) 

# Second sequence is dependend variable 
# - what behavior preceeds dyadic coping signals?
StateTrans(my.s, FALSE) 

# investigating a single case
StateTrans(my.s, FALSE)[[41]] 




