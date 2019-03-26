library(ppls)


### Name: cookie
### Title: Near-Infrared (NIR) Spectroscopy of Biscuit Doughs
### Aliases: cookie
### Keywords: datasets

### ** Examples

    data(cookie) # load data
    X<-as.matrix(cookie[,1:700]) # extract NIR spectra
    Y<-as.matrix(cookie[,701:704]) # extract constituents
    Xtrain<-X[1:40,] # extract training data
    Ytrain<-Y[1:40,] # extract training data
    Xtest<-X[41:72,] # extract test data
    Ytest<-Y[41:72,] # extract test data
    


