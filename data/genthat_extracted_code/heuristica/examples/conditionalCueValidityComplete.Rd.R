library(heuristica)


### Name: conditionalCueValidityComplete
### Title: Calculate conditional cue validity, which includes reversing and
###   ranks.
### Aliases: conditionalCueValidityComplete

### ** Examples

# The data below differentiates between cue validity and conditional cue
# validity.  Cue validity of x1 is 1.0.  Cue validity of x2 is 0.5.
# But after you've chosen x1 as the highest-validity cue, only row2
# vs. row3 is undecided  x2 predictions correctly on those, so its
# conditional cue validity is 1.0 (conditional on x1 being first).
data <- cbind(y=c(5,4,3), x1=c(1,0,0), x2=c(0,1,0))
out <- conditionalCueValidityComplete(data, 1, c(2:3))
# This tells you both cues had validity 1-- it returns 1, 1.
out$cue_validities
# This tells you to choose x1 first-- it returns 1, 0.
out$cue_ranks
# This tells you they already point in the correct direction.
out$cue_directions
# For a case with a negative cue direction, try this data:
data2 <- cbind(y=c(5,4,3), x1=c(1,0,0), x2=c(1,0,1))
conditionalCueValidityComplete(data2, 1, c(2:3))




