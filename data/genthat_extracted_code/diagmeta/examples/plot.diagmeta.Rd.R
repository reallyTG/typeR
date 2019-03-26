library(diagmeta)


### Name: plot.diagmeta
### Title: Plot for meta-analysis of diagnostic test accuracy studies with
###   the multiple cutoffs model
### Aliases: plot.diagmeta

### ** Examples


# FENO dataset
#
data(Schneider2017)

diag1 <- diagmeta(tpos, fpos, tneg, fneg, cutpoint,
                  studlab = paste(author, year, group),
                  data = Schneider2017,
                  model = "DIDS", log.cutoff = TRUE)


# Regression plot with confidence intervals
#
plot(diag1, which = "reg", lines = FALSE, ci = TRUE)

# Cumulative distribution plot with optimal cutoff line and
# confidence intervals
#
plot(diag1, which = "cdf", line.optcut = TRUE, ci = TRUE)

# Survival plot with optimal cutoff line and confidence intervals
#
plot(diag1, which = "survival", line.optcut = TRUE, ci = TRUE)

# Youden plot of optimal cutoff line and confidence intervals
#
plot(diag1, which = "youden",
     lines = TRUE, line.optcut = TRUE, ci = TRUE)

# ROC plot of lines connecting points belonging to the same study
#
plot(diag1, which = "ROC", lines = TRUE)

# SROC plot of confidence regions for sensitivity and specificity
# with optimal cutoff mark
#
plot(diag1, which = "SROC",
     ciSens = TRUE, ciSpec = TRUE, mark.optcut = TRUE,
     shading = "hatch")

# Density plot of densities for both groups with optimal cutoff
# line
#
plot(diag1, which = "density", line.optcut = TRUE)




