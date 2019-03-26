library(accSDA)


### Name: print.ASDA
### Title: Print method for ASDA object
### Aliases: print.ASDA

### ** Examples

    # Prepare training and test set
    train <- c(1:40,51:90,101:140)
    Xtrain <- iris[train,1:4]
    nX <- normalize(Xtrain)
    Xtrain <- nX$Xc
    Ytrain <- iris[train,5]
    Xtest <- iris[-train,1:4]
    Xtest <- normalizetest(Xtest,nX)
    Ytest <- iris[-train,5]

    # Run the algorithm
    resDef <- ASDA(Xtrain,Ytrain)

    # Print
    print(resDef)



