library(dynamicTreeCut)


### Name: merge2Clusters
### Title: Merge Two Clusters
### Aliases: merge2Clusters
### Keywords: misc

### ** Examples


options(stringsAsFactors = FALSE);

# Works with character labels:
labels = c(rep("grey", 5), rep("blue", 2), rep("red", 3))
merge2Clusters(labels, "blue", "red")

# Works with factor labels:
labelsF = factor(labels)
merge2Clusters(labelsF, "blue", "red")

# Works also with numeric labels:

labelsN = as.numeric(factor(labels))
labelsN
merge2Clusters(labelsF, 1, 3)





