library(heuristica)


### Name: ttbGreedyModel
### Title: Greedy Take The Best
### Aliases: ttbGreedyModel

### ** Examples

## A data set where Take the Best and Greedy Take the Best disagree.
matrix <- cbind(y=c(3:1), x1=c(1,0,0), x2=c(1,0,1))
ttb <- ttbModel(matrix, 1, c(2,3))
ttb$cue_validities
# Returns
#  x1  x2 
# 1.0 0.5
ttbG <- ttbGreedyModel(matrix, 1, c(2:3))
ttbG$cue_validities
# Returns
#  x1  x2 
#   1   1
# because after using x1, only decisions between row 2 and 3 are left,
# and x2 gets 100% right  on those (after reversal).  However, these
# cue_validities depend on using x1, first, so cue_rank is key.
ttbG$cue_ranks
# Returns
#  x1  x2 
#   1   2

# Now see how this affects predictions on row 2 vs. 3.
# Take the best guesses (output 0).
predictPair(oneRow(matrix, 2), oneRow(matrix, 3), ttb)
# Greedy Take The Best selects row 2 (output 1).
predictPair(oneRow(matrix, 2), oneRow(matrix, 3), ttbG)




