library(survminer)


### Name: pairwise_survdiff
### Title: Multiple Comparisons of Survival Curves
### Aliases: pairwise_survdiff

### ** Examples


library(survival)
library(survminer)
data(myeloma)

# Pairwise survdiff
res <- pairwise_survdiff(Surv(time, event) ~ molecular_group,
     data = myeloma)
res

# Symbolic number coding
symnum(res$p.value, cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 0.1, 1),
   symbols = c("****", "***", "**", "*", "+", " "),
   abbr.colnames = FALSE, na = "")





