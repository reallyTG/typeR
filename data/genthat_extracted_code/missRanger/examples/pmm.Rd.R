library(missRanger)


### Name: pmm
### Title: Predictive Mean Matching
### Aliases: pmm

### ** Examples

pmm(xtrain = c(0.2, 0.2, 0.8), xtest = 0.3, ytrain = c(0, 0, 1), k = 1) # 0
pmm(xtrain = c(0.2, 0.2, 0.8), xtest = 0.3, ytrain = c(0, 0, 1), k = 3) # 0 or 1
pmm(xtrain = c("A", "A", "B"), xtest = "B", ytrain = c("B", "A", "B"), k = 1) # B
pmm(xtrain = c("A", "A", "B"), xtest = "B", ytrain = c("B", "A", "B"), k = 2) # A or B



