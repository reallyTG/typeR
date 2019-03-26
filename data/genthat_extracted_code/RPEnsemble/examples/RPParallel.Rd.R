library(RPEnsemble)


### Name: RPParallel
### Title: Chooses a projection from each block in parallel
### Aliases: RPParallel

### ** Examples

Train <- RPModel(1, 50, 100, 0.5)
Test <- RPModel(1, 100, 100, 0.5)
Out <- RPParallel(XTrain = Train$x, YTrain = Train$y, XTest = Test$x, d = 2, B1 = 10, 
B2 = 10, base = "LDA", projmethod = "Haar", estmethod = "training")
colMeans(Out)



