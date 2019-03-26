library(metaviz)


### Name: viz_forest
### Title: Forest plot variants for meta-analyses
### Aliases: viz_forest

### ** Examples

library(metaviz)
# Plotting the mozart data using a classic forest plot
viz_forest(x = mozart[, c("d", "se")],
study_labels = mozart[, "study_name"], xlab = "Cohen d")

# Subgroup analysis of published and unpublished studies shown in a rainforest plot
viz_forest(x = mozart[, c("d", "se")], study_labels = mozart[, "study_name"], method = "REML",
variant = "rain", summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"),
group = mozart[, "rr_lab"], xlab = "Cohen d")

# Thick forest plot with additional information in aligned tables. Log risk
# ratios are labeled in their original metric (risk ratios) on the x axis.
viz_forest(x = exrehab[, c("logrr", "logrr_se")], variant = "thick",
xlab = "RR", x_trans_function = exp, annotate_CI = TRUE,
study_table = data.frame(
Name = exrehab[, "study_name"],
eventsT = paste(exrehab$ai, "/", exrehab$ai + exrehab$bi, sep = ""),
eventsC = paste(exrehab$ci, "/", exrehab$ci + exrehab$di, sep = "")),
summary_table = data.frame(
Name = "Summary",
eventsT = paste(sum(exrehab$ai), "/", sum(exrehab$ai + exrehab$bi), sep = ""),
eventsC = paste(sum(exrehab$ci), "/", sum(exrehab$ci + exrehab$di), sep = "")),
table_layout = matrix(c(1, 1, 2, 2, 3), nrow = 1))



