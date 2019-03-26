library(huge)


### Name: huge.roc
### Title: Draw ROC Curve for a graph path
### Aliases: huge.roc

### ** Examples

#generate data
L = huge.generator(d = 200, graph = "cluster", prob = 0.3)
out1 = huge(L$data)

#draw ROC curve
Z1 = huge.roc(out1$path,L$theta)

#Maximum F1 score
max(Z1$F1)



