library(ROCit)


### Name: summary.rocit
### Title: Summary of rocit object
### Aliases: summary.rocit

### ** Examples

data("Diabetes")
roc_empirical <- rocit(score = Diabetes$chol, class = Diabetes$dtest,
                       negref = "-")
# ---------------------
summary(roc_empirical)





