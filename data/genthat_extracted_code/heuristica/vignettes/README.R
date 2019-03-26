## ------------------------------------------------------------------------
library(heuristica)

## ------------------------------------------------------------------------
schools <- data.frame(Name=c("Bowen", "Collins", "Fenger", "Juarez", "Young"), Dropout_Rate=c(25.5, 11.8, 28.7, 21.6, 4.5), Low_Income_Students=c(82.5, 88.8, 63.2, 84.5, 30.3), Limited_English_Students=c(11.4, 0.1, 0, 28.3, 0.1))
schools

## ------------------------------------------------------------------------
criterion_col <- 2
ttb <- ttbModel(schools, criterion_col, c(3:4))
reg <- regModel(schools, criterion_col, c(3:4))

## ------------------------------------------------------------------------
ttb$cue_validities
coef(reg)

## ------------------------------------------------------------------------
predictPair(subset(schools, Name=="Bowen"), subset(schools, Name=="Collins"), ttb)
predictPair(subset(schools, Name=="Bowen"), subset(schools, Name=="Fenger"), ttb)

## ------------------------------------------------------------------------
predictPair(subset(schools, Name=="Collins"), subset(schools, Name=="Bowen"), ttb)

## ------------------------------------------------------------------------
out <- predictPairSummary(schools, ttb, reg)
# See the first row: It has row indexes.
out[1,]
# Convert indexes to school names for easier interpretation
out_df <- data.frame(out)
out_df$Row1 <- schools$Name[out_df$Row1]
out_df$Row2 <- schools$Name[out_df$Row2]
out_df

## ------------------------------------------------------------------------
# Same as predictPairSummary.
out_same <- rowPairApply(schools, rowIndexes(), correctGreater(criterion_col), heuristics(ttb, reg))
out_same[1,]

# Show first the heuristic predictions, then CorrectGreater.  No row indexes.
out_simple <- rowPairApply(schools, heuristics(ttb, reg), correctGreater(criterion_col))
out_simple[1,]

## ------------------------------------------------------------------------
percentCorrect(schools, ttb, reg)

