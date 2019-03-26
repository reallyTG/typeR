library(SeleMix)


### Name: pred.y
### Title: Prediction of y variables
### Aliases: pred.y

### ** Examples


# Parameter estimation with one contaminated variable and one covariate
  data(ex1.data)
# Parameters estimated applying ml.est to \code{ex1.data} 
  B1 <- as.matrix(c(-0.152, 1.215))
  sigma1 <- as.matrix(1.25)
  lambda1 <- 15.5
  w1 <- 0.0479

# Variable prediction
  ypred <- pred.y (y=ex1.data[,"Y1"],  x=ex1.data[,"X1"], B=B1,
          sigma=sigma1, lambda=lambda1, w=w1, model="LN", t.outl=0.5)
# Plot ypred vs Y1
  sel.pairs(cbind(ypred[,1,drop=FALSE],ex1.data[,"Y1",drop=FALSE]),
            outl=ypred[,"outlier"])



