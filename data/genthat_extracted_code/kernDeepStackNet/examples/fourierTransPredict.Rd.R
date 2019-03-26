library(kernDeepStackNet)


### Name: fourierTransPredict
### Title: Prediction based on random Fourier transformation
### Aliases: fourierTransPredict
### Keywords: models & regression

### ** Examples

# Generate data matrix
set.seed(50)
X <- matrix(rnorm(100*3), ncol=3)

# Apply a random Fourier transformation of higher dimension
rft <- randomFourierTrans(X=X, Dim=3, sigma=1, seedW=0)

# New data matrix
set.seed(100)
Xnew <- matrix(rnorm(100*3), ncol=3)

# Apply same Fourier transformation on new data
newZ <- fourierTransPredict(newx=Xnew, rW=rft$rW)
head(newZ)



