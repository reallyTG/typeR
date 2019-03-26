library(RPEnsemble)


### Name: RPEnsemble-package
### Title: Random Projection Ensemble Classification
### Aliases: RPEnsemble-package RPEnsemble

### ** Examples

#generate data from Model 1
set.seed(101)
Train <- RPModel(2, 50, 100, 0.5)
Test <- RPModel(2, 100, 100, 0.5)

#Classify the training and test set for B1 = 10 independent projections, each 
#one carefully chosen from a block of size B2 = 10, using the "knn" base 
#classifier and the leave-one-out test error estimate
Out <- RPParallel(XTrain = Train$x, YTrain = Train$y, XTest = Test$x, d = 2, 
B1 = 10, B2 = 10, base = "knn", projmethod = "Haar", estmethod = "loo",  
splitsample = FALSE, k = seq(1, 25, by = 3), clustertype = "Default")

#estimate the class 1 prior probability
phat <- sum(Train$y == 1)/50

#choose the best empirical value of the voting threshold alpha
alphahat <- RPalpha(RP.out = Out, Y = Train$y, p1 = phat)

#combine the base classifications  
Class <- RPEnsembleClass(RP.out = Out, n = 50, 
n.test = 100, p1 = phat, alpha = alphahat)

#calculate the error
mean(Class != Test$y)



#Code for sample splitting version of the above
#n.val <- 25
#s <- sample(1:50,25)
#OutSS <- RPParallel(XTrain = Train$x[-s,], YTrain = Train$y[-s], 
#XVal = Train$x[s,], YVal = Train$y[s],  XTest = Test$x, d = 2, 
#B1 = 50, B2 = 10, base = "knn", projmethod = "Haar", estmethod = "samplesplit",
#k = seq(1,13, by = 2), clustertype = "Fork", cores = 1)
#alphahatSS <- RPalpha(RP.out = OutSS, Y = Train$y[s], p1 = phat)
#ClassSS <- RPEnsembleClass(RP.out = OutSS, n.val = 25, n.test = 100, 
#p1 = phat, samplesplit = TRUE, alpha = alphahatSS)
#mean(ClassSS != Test$y)



