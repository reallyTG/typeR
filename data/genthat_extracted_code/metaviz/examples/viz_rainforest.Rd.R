library(metaviz)


### Name: viz_rainforest
### Title: Rainforest plots for meta-analyses
### Aliases: viz_rainforest rainforest

### ** Examples

library(metaviz)
# Plotting a rainforest plot using the mozart data
viz_rainforest(x = mozart[, c("d", "se")],
study_labels = mozart[, "study_name"], xlab = "Cohen d")

# Visualizing a subgroup analysis of published and unpublished studies
viz_rainforest(x = mozart[, c("d", "se")], group = mozart[, "rr_lab"],
study_labels = mozart[, "study_name"], method = "REML",
summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"),
xlab = "Cohen d")

# Showing additional information in aligned tables. Log risk ratios are labeled
# in their original metric (risk ratios) on the x axis.
viz_rainforest(x = exrehab[, c("logrr", "logrr_se")],
annotate_CI = TRUE, xlab = "RR", x_trans_function = exp,
study_table = data.frame(
Name = exrehab[, "study_name"],
eventsT = paste(exrehab$ai, "/", exrehab$ai + exrehab$bi, sep = ""),
eventsC = paste(exrehab$ci, "/", exrehab$ci + exrehab$di, sep = "")),
summary_table = data.frame(
Name = "Summary",
eventsT = paste(sum(exrehab$ai), "/", sum(exrehab$ai + exrehab$bi), sep = ""),
eventsC = paste(sum(exrehab$ci), "/", sum(exrehab$ci + exrehab$di), sep = "")))



