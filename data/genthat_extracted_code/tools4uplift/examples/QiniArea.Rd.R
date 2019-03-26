library(tools4uplift)


### Name: QiniArea
### Title: Qini coefficient
### Aliases: QiniArea
### Keywords: Qini performance

### ** Examples


library(tools4uplift)
data("SimUplift")

square1 <- SquareUplift(SimUplift, "X1", "X2", "treat", "y")

#performance of the heat map uplift estimation on the training dataset
perf <- QiniTable(data = square1, treat = "treat", 
                  outcome = "y", prediction = "Uplift_X1_X2", nb.group = 5)

QiniArea(perf)




