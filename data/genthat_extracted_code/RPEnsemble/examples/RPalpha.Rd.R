library(RPEnsemble)


### Name: RPalpha
### Title: Choose alpha
### Aliases: RPalpha

### ** Examples

Train <- RPModel(1, 50, 100, 0.5)
Test <- RPModel(1, 100, 100, 0.5)
Out <- RPParallel(XTrain = Train$x, YTrain = Train$y, XTest = Test$x, d = 2, B1 = 10, 
B2 = 10, base = "LDA", projmethod = "Haar", estmethod = "training", cores = 1)
alpha <- RPalpha(RP.out = Out, Y = Train$y, p1 = sum(Train$y == 1)/length(Train$y))
alpha




