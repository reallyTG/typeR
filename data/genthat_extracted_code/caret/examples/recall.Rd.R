library(caret)


### Name: recall
### Title: Calculate recall, precision and F values
### Aliases: recall recall.default recall.table precision precision.default
###   precision.table precision.matrix F_meas F_meas.default F_meas.table
### Keywords: manip

### ** Examples


###################
## Data in Table 2 of Powers (2007)

lvs <- c("Relevant", "Irrelevant")
tbl_2_1_pred <- factor(rep(lvs, times = c(42, 58)), levels = lvs)
tbl_2_1_truth <- factor(c(rep(lvs, times = c(30, 12)),
                          rep(lvs, times = c(30, 28))),               
                        levels = lvs)
tbl_2_1 <- table(tbl_2_1_pred, tbl_2_1_truth)

precision(tbl_2_1)
precision(data = tbl_2_1_pred, reference = tbl_2_1_truth, relevant = "Relevant")
recall(tbl_2_1)
recall(data = tbl_2_1_pred, reference = tbl_2_1_truth, relevant = "Relevant")


tbl_2_2_pred <- factor(rep(lvs, times = c(76, 24)), levels = lvs)
tbl_2_2_truth <- factor(c(rep(lvs, times = c(56, 20)),
                          rep(lvs, times = c(12, 12))),               
                        levels = lvs)
tbl_2_2 <- table(tbl_2_2_pred, tbl_2_2_truth)

precision(tbl_2_2)
precision(data = tbl_2_2_pred, reference = tbl_2_2_truth, relevant = "Relevant")
recall(tbl_2_2)
recall(data = tbl_2_2_pred, reference = tbl_2_2_truth, relevant = "Relevant")




