library(Cubist)


### Name: dotplot.cubist
### Title: Visualization of Cubist Rules and Equations
### Aliases: dotplot.cubist
### Keywords: hplot

### ** Examples


library(mlbench)
data(BostonHousing)

## 1 committee and no instance-based correction, so just an M5 fit:
mod1 <- cubist(x = BostonHousing[, -14], y = BostonHousing$medv)
dotplot(mod1, what = "splits")
dotplot(mod1, what = "coefs")

## Now with 10 committees
mod2 <- cubist(x = BostonHousing[, -14], 
               y = BostonHousing$medv, 
               committees = 10)
dotplot(mod2, scales = list(y = list(cex = .25)))
dotplot(mod2, what = "coefs", 
        between = list(x = 1, y = 1),
        scales = list(x = list(relation = "free"), 
                      y = list(cex = .25)))




