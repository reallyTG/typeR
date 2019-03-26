## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(include = TRUE, echo = TRUE, eval = TRUE, message = FALSE, warning = FALSE, 
                      fig.width = 8, fig.asp = 0.618, out.width = "100%", fig.align = "center", 
                      cache = T)

## ------------------------------------------------------------------------
library(metaviz)

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], study_labels = mozart[1:10, c("study_name")],
           summary_label = "Summary effect", xlab = "Cohen d")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], study_labels = mozart[1:10, c("study_name")],
           summary_label = "Summary effect", xlab = "Cohen d", variant = "rain")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], study_labels = mozart[1:10, c("study_name")],
           summary_label = "Summary effect", xlab = "Cohen d", variant = "thick", method = "FE")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], study_labels = mozart[1:10, c("study_name")],
           summary_label = "Summary effect", xlab = "Cohen d", variant = "rain", method = "DL")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], 
           group = mozart[1:10, "rr_lab"], 
           study_labels = mozart[1:10, "study_name"], 
           summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"), 
           xlab = "Cohen d",
           col = "Greys",
           variant = "rain")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[, c("d", "se")], 
           group = mozart[, "rr_lab"], 
           study_labels = mozart[, "study_name"], 
           summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"), 
           xlab = "Cohen d",
           variant = "thick",
           type = "cumulative")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:5, c("d", "se")],
           study_labels = mozart[1:5, "study_name"], 
           xlab = "Cohen d",
           variant = "rain",
           type = "sensitivity")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], 
           group = mozart[1:10, "rr_lab"],
           study_labels = mozart[1:10, "study_name"], 
           summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"), 
           xlab = "Cohen d", 
           variant = "thick",
           annotate_CI = TRUE)

## ------------------------------------------------------------------------
study_table <- data.frame(
  name = exrehab[, "study_name"],
  eventsT = paste(exrehab$ai, "/", exrehab$ai + exrehab$bi, sep = ""),
  eventsC = paste(exrehab$ci, "/", exrehab$ci + exrehab$di, sep = ""))
head(study_table)

## ------------------------------------------------------------------------
summary_table <- data.frame(
    name = "Summary",
    eventsT = paste(sum(exrehab$ai), "/", sum(exrehab$ai + exrehab$bi), sep = ""),
    eventsC = paste(sum(exrehab$ci), "/", sum(exrehab$ci + exrehab$di), sep = ""))
head(summary_table)

## ---- fig.asp = 0.5, fig.width = 10, dpi = 300---------------------------
viz_forest(x = exrehab[, c("logrr", "logrr_se")], variant = "classic",
col = "Greys", xlab = "logRR", annotate_CI = T, 
study_table = study_table,
summary_table = summary_table,
table_headers = c("ID", "Events (T)", "Events (C)"))

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = exrehab[, c("logrr", "logrr_se")], variant = "classic",
col = "Greys", xlab = "logRR", x_limit = c(-0.35, 0.05),
annotate_CI = T, type = "sensitivity",
study_table = data.frame(left_out = exrehab[, "study_name"],
                         remaining_N = sum(exrehab[, "n1i"] + exrehab[, "n2i"]) - 
                           (exrehab[, "n1i"] + exrehab[, "n2i"])),
summary_table = "None",
table_headers = c("Study left out", "N remaining", "log Risk Ratio [95% CI]"),
table_layout = matrix(c(1, 2, 3), nrow = 1))

## ---- fig.asp = 0.5, fig.width = 10, dpi = 300---------------------------
viz_forest(x = exrehab[, c("logrr", "logrr_se")], variant = "thick",
study_labels = exrehab[, "study_name"], col = "Greys", 
study_table = study_table,
summary_table = summary_table,
annotate_CI = T,
table_headers = c("ID", "Events (T)", "Events (C)"),
x_trans_function = exp, xlab = "RR")

## ---- dpi = 300----------------------------------------------------------
viz_forest(x = mozart[1:10, c("d", "se")], 
           group = mozart[1:10, "rr_lab"], 
           study_labels = mozart[1:10, "study_name"], 
           summary_label = c("Summary (rr_lab = no)", "Summary (rr_lab = yes)"), 
           xlab = "Cohen d",
           col = c("firebrick", "steelblue4")[mozart[1:10, "rr_lab"]],
           summary_col = c("firebrick", "steelblue4"))

## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(include = TRUE, echo = TRUE, eval = TRUE, message = FALSE, warning = FALSE, 
                      fig.width = 6, fig.asp = 0.85, out.width = "80%", fig.align = "center", 
                      cache = T)

## ---- dpi = 300----------------------------------------------------------
viz_funnel(brainvol[, c("z", "z_se")])

## ---- dpi = 300----------------------------------------------------------
viz_funnel(brainvol[, c("z", "z_se")],
           method = "DL",
           contours_col = "Greys",
           xlab = "r", x_trans_function = tanh, 
           x_breaks = atanh(c(-0.9, -0.7, -0.3, 0, 0.3, 0.7, 0.9)))

## ---- dpi = 300----------------------------------------------------------
viz_funnel(exrehab[, c("logrr", "logrr_se")], 
           contours_col = "Greys",
           trim_and_fill = TRUE, trim_and_fill_side = "right", 
           egger = TRUE)

## ---- dpi = 300----------------------------------------------------------
viz_funnel(mozart[1:10, c("d", "se")], sig_contours = FALSE, addev_contours = TRUE)

## ---- dpi = 300----------------------------------------------------------
viz_sunset(homeopath[, c("d", "se")])

## ---- dpi = 300----------------------------------------------------------
viz_sunset(homeopath[, c("d", "se")], true_effect = -0.3, sig_level = 0.1, power_contours = "continuous")

