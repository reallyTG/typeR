library(accSDA)


### Name: ASDABarPlot
### Title: barplot for ASDA objects
### Aliases: ASDABarPlot

### ** Examples

    # Generate and ASDA object with your data, e.g.
    # Prepare training and test set
    # This is a very small data set, I advise you to try it on something with more
    # variables, e.g. something from this source: http://www.cs.ucr.edu/~eamonn/time_series_data/
    # or possibly run this on the Gaussian data example from the ASDA function
    train <- c(1:40,51:90,101:140)
    Xtrain <- iris[train,1:4]
    nX <- normalize(Xtrain)
    Xtrain <- nX$Xc
    Ytrain <- iris[train,5]
    Xtest <- iris[-train,1:4]
    Xtest <- normalizetest(Xtest,nX)
    Ytest <- iris[-train,5]
    # Run the method
    resIris <- ASDA(Xtrain,Ytrain)

    # Look at the barplots of the DVs
    ASDABarPlot(resIris)



