## ------------------------------------------------------------------------
library(heuristica)

## ------------------------------------------------------------------------
data("city_population")
data_set <- na.omit(city_population)
criterion_col <- 3
cols_to_fit <- 4:ncol(data_set)

## ------------------------------------------------------------------------
num_training_rows <- 5
train_data <- city_population[c(3:(3+num_training_rows)),]
ttb <- ttbModel(train_data, criterion_col, cols_to_fit)
reg <- regModel(train_data, criterion_col, cols_to_fit)
lreg <- logRegModel(train_data, criterion_col, cols_to_fit)

## ------------------------------------------------------------------------
out_fwd_row_pairs_only <- predictPairSummary(train_data, ttb, reg, lreg)
fwd_df <- data.frame(out_fwd_row_pairs_only)
fwd_df$Row1 <- train_data$Name[fwd_df$Row1]
fwd_df$Row2 <- train_data$Name[fwd_df$Row2]
fwd_df

## ------------------------------------------------------------------------
ref_data <- out_fwd_row_pairs_only[,"CorrectGreater"]
predictions <- out_fwd_row_pairs_only[,"ttbModel"]
ttb_fwd_confusion_matrix <- confusionMatrixFor_Neg1_0_1(ref_data, predictions)

## ------------------------------------------------------------------------
out_fwd_row_pairs_only <- predictPairSummary(train_data, ttb, reg, lreg)
train_data_rev_rows <- train_data[c(nrow(train_data):1),]
out_rev_row_pairs_only <- predictPairSummary(train_data_rev_rows, ttb, reg, lreg)
out_both <- rbind(out_fwd_row_pairs_only, out_rev_row_pairs_only)
both_df <- data.frame(out_both)
both_df$Row1 <- train_data$Name[both_df$Row1]
both_df$Row2 <- train_data$Name[both_df$Row2]
both_df

## ------------------------------------------------------------------------
ref_data <- out_both[,"CorrectGreater"]
predictions <- out_both[,"ttbModel"]
confusionMatrixFor_Neg1_0_1(ref_data, predictions)

## ------------------------------------------------------------------------
ttb_fwd_confusion_matrix + reverseRowsAndReverseColumns(ttb_fwd_confusion_matrix)

## ------------------------------------------------------------------------
out <- rowPairApplyList(train_data, list(correctGreater(criterion_col), heuristics(ttb, reg, lreg)), also_reverse_row_pairs=TRUE)
out

## ------------------------------------------------------------------------
ref_data <- out[,"CorrectGreater"]
predictions <- out[,"ttbModel"]
confusionMatrixFor_Neg1_0_1(ref_data, predictions)

## ------------------------------------------------------------------------
confusion_matrix_3x3_ttb <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"ttbModel"])
confusion_matrix_3x3_ttb

confusion_matrix_3x3_reg <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"regModel"])
confusion_matrix_3x3_reg

confusion_matrix_3x3_lreg <- confusionMatrixFor_Neg1_0_1(out[,"CorrectGreater"], out[,"logRegModel"])
confusion_matrix_3x3_lreg

## ------------------------------------------------------------------------
out_df <- data.frame(out)
out_df[out_df$regModel != out_df$logRegModel,]

## ------------------------------------------------------------------------
confusion_matrix_3x3_ttb
confusion_matrix_ttb <- collapseConfusionMatrix3x3To2x2(confusion_matrix_3x3_ttb)
confusion_matrix_ttb

## ------------------------------------------------------------------------
percent_correct_ttb <- 100 *sum(diag(confusion_matrix_ttb)) / sum(confusion_matrix_ttb)
percent_correct_ttb

## ------------------------------------------------------------------------
percentCorrect(train_data, ttb)

## ------------------------------------------------------------------------
confusion_matrix_3x3_reg
confusion_matrix_reg <- collapseConfusionMatrix3x3To2x2(confusion_matrix_3x3_reg)
confusion_matrix_reg

## ------------------------------------------------------------------------
statsFromConfusionMatrix(confusion_matrix_ttb)

