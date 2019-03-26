library(RPEnsemble)


### Name: RPChooseSS
### Title: A sample splitting version of 'RPChoose'
### Aliases: RPChooseSS

### ** Examples

set.seed(100)
Train <- RPModel(1, 50, 100, 0.5)
Validate <- RPModel(1, 50, 100, 0.5)
Test <- RPModel(1, 100, 100, 0.5)
Choose.out5 <- RPChooseSS(XTrain = Train$x, YTrain = Train$y, XVal = Validate$x, 
YVal = Validate$y, XTest = Test$x, d = 2, B2 = 5, base = "QDA", projmethod = "Haar")
Choose.out10 <- RPChooseSS(XTrain = Train$x, YTrain = Train$y, XVal = Validate$x, 
YVal = Validate$y, XTest = Test$x, d = 2, B2 = 10, base = "QDA", projmethod = "Haar")
sum(Choose.out5[1:50] != Validate$y)
sum(Choose.out10[1:50] != Validate$y)
sum(Choose.out5[51:150] != Test$y)
sum(Choose.out10[51:150] != Test$y)



