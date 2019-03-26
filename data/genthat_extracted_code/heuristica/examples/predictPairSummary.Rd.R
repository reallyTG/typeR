library(heuristica)


### Name: predictPairSummary
### Title: Returns the row indices, correct answer, and predictions for all
###   row pairs.
### Aliases: predictPairSummary

### ** Examples

# Get some data and fit it with two models.
train_df <- data.frame(criterion=c(9,8,7,6), a=c(101,101,2,2), b=c(59,58,5,59))
criterion_col <- 1
ttb <- ttbModel(train_df, criterion_col, c(2:3))
lreg <- logRegModel(train_df, criterion_col, c(2:3))

# Generate predictions and correct answers with predictPairSummary.
out <- predictPairSummary(train_df, ttb, lreg)

# Find rows where the models make differing predictions, subsetting on a
# data.frame.
out_df <- data.frame(out)
out_df[out_df$ttbModel != out_df$logRegModel,]
# Outputs:
#   Row1 Row2 CorrectGreater ttbModel logRegModel
#    1    2              1        1          -1
#    3    4              1       -1           1
# So there are only two cases of differing predictions.
# 1) For row 1 vs. 2, TTB predicted 1 and logReg predicted -1.
#    CorrectGreater says 1, so TTB was right.
# 2) For row 3 vs. 4, TTB predicted -1 and logReg predicted 1.
#    CorrectGreater says -1, so logReg was right.

# Note that under the hood, the above predictPairSummary call could be
# done with rowPairApply like this:
out2 <- rowPairApply(train_df, rowIndexes(),
                     correctGreater(criterion_col), heuristics(ttb, lreg))




