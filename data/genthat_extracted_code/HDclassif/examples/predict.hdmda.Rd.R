library(HDclassif)


### Name: predict.hdmda
### Title: Prediction method for 'hdmda' class objects.
### Aliases: predict.hdmda
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the Wine data set
data(wine)
cls = wine[,1]; X = scale(wine[,-1])

# A simple use...
out = hdmda(X[1:100,],cls[1:100])
res = predict(out,X[101:nrow(X),])



