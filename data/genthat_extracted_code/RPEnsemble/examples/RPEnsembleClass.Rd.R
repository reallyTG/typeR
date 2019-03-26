library(RPEnsemble)


### Name: RPEnsembleClass
### Title: Classifies the test set using the random projection ensemble
###   classifier
### Aliases: RPEnsembleClass

### ** Examples

Train <- RPModel(1, 50, 100, 0.5)
Test <- RPModel(1, 100, 100, 0.5)
Out <- RPParallel(XTrain = Train$x, YTrain = Train$y, XTest = Test$x, 
d = 2, B1 = 50, B2 = 10, base = "LDA", projmethod = "Haar", 
estmethod = "training", clustertype = "Default")
Class <- RPEnsembleClass(RP.out = Out, n = length(Train$y), 
n.test = nrow(Test$x), p1 = sum(Train$y == 1)/length(Train$y),  
splitsample = FALSE,  alpha = RPalpha(Out, Y = Train$y, 
p1 = sum(Train$y == 1)/length(Train$y)))
mean(Class != Test$y)



