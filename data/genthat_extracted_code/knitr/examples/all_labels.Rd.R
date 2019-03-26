library(knitr)


### Name: all_labels
### Title: Get all chunk labels in a document
### Aliases: all_labels all_rcpp_labels

### ** Examples

# the examples below are meaningless unless you put them in a knitr document
all_labels()
all_labels(engine == "Rcpp")
all_labels(echo == FALSE && results != "hide")
# or separate the two conditions
all_labels(echo == FALSE, results != "hide")



