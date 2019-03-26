library(heuristica)


### Name: heuristics
### Title: Wrap fitted heuristics to pass to rowPairApply to call
###   predictPair.
### Aliases: heuristics

### ** Examples

# Use one fitted ttbModel with column 1 as criterion and columns 2,3 as
# cues.
data <- cbind(y=c(30,20,10,5), x1=c(1,1,0,0), x2=c(1,1,0,1))
ttb <- ttbModel(data, 1, c(2:3))
rowPairApply(data, heuristics(ttb))
# This outputs ttb's predictions for all 6 row pairs of data.
# (It has 6 row pairs because 4*2/2 = 6.)  It gets the predictions
# by calling ttb's predictPairInternal.

# Use the same fitted ttbModel plus a unit weight model with the same
# criterion and cues.
unit <- unitWeightModel(data, 1, c(2,3))
rowPairApply(data, heuristics(ttb, unit))
# This outputs predictions with column names 'ttbModel' and
# 'unitWeightLinearModel'.

# Use the same fitted ttbModel plus another ttbModel that has different
# cols_to_fit.  This has to be put in a separate heuristicsList function.
ttb_just_col_3 <- ttbModel(data, 1, c(3), fit_name="ttb3")
rowPairApply(data, heuristics(ttb), heuristics(unit))
# This outputs predictions with column names 'ttbModel' and
# 'ttb3'.




