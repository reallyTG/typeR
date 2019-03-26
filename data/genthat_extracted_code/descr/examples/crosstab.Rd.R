library(descr)


### Name: crosstab
### Title: Cross tabulation with mosaic plot
### Aliases: crosstab

### ** Examples

educ <- sample(c(1, 2), 200, replace = TRUE, prob = c(0.3, 0.7))
educ <- factor(educ, levels = c(1, 2), labels = c("Low", "High"))
opinion <- sample(c(1, 2, 9), 200, replace = TRUE,
                 prob = c(0.4, 0.55, 0.05))
opinion <- factor(opinion, levels = c(1, 2, 9),
                 labels = c("Disagree", "Agree", "Don't know"))
attr(educ, "label") <- "Education level"
attr(opinion, "label") <- "Opinion"
weight <- sample(c(10, 15, 19), 200, replace = TRUE)

crosstab(opinion, educ, xlab = "Education", ylab = "Opinion")
ct <- crosstab(opinion, educ, weight,
               dnn = c("Opinion", "Education"),
               user.missing.dep = "Don't know",
               expected = TRUE, prop.c = TRUE, prop.r = TRUE,
               plot = FALSE)
ct
plot(ct, inv.y = TRUE)

# Get the table of observed values as an object of class "table"
tab <- ct$tab
class(tab)
tab

# Get the complete cross table as "matrix"
complete.tab <- descr:::CreateNewTab(ct)
class(complete.tab)
complete.tab

## xtable support
library(xtable)

# Print ugly table
print(xtable(ct))

# Print pretty table
# Add to the preamble of your Rnoweb document:
# \usepackage{booktabs}
# \usepackage{multirow}
# \usepackage{dcolumn}
# \newcolumntype{d}{D{.}{.}{-1}}
print(xtable(ct, align = "llddd", multirow = TRUE, hline = TRUE,
             row.labels = TRUE, percent = FALSE,
             caption = "Opinion according to level of education"),
      booktabs = TRUE, include.rownames = FALSE,
      sanitize.text.function = function(x) x)



