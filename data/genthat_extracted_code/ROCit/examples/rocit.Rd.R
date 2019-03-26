library(ROCit)


### Name: rocit
### Title: ROC Analysis of Binary Classifier
### Aliases: rocit

### ** Examples

# ---------------------
data("Diabetes")
roc_empirical <- rocit(score = Diabetes$chol, class = Diabetes$dtest,
                       negref = "-") # default method empirical
roc_binormal <- rocit(score = Diabetes$chol, class = Diabetes$dtest,
                     negref = "-", method = "bin")

# ---------------------
summary(roc_empirical)
summary(roc_binormal)

# ---------------------
plot(roc_empirical)
plot(roc_binormal, col = c("#00BA37", "#F8766D"),
       legend = FALSE, YIndex = FALSE)





