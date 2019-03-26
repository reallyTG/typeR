library(accSDA)


### Name: predict.ASDA
### Title: Predict method for sparse discriminant analysis
### Aliases: predict.ASDA

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

    # Define parameters for SDAD
    Om <- diag(4)+0.1*matrix(1,4,4) #elNet coef mat
    gam <- 0.01
    lam <- 0.01
    method <- "SDAD"
    q <- 2
    control <- list(PGsteps = 100,
                    PGtol = c(1e-5,1e-5),
                    mu = 1,
                    maxits = 100,
                    tol = 1e-3,
                    quiet = FALSE)

    # Run the algorithm
    res <- ASDA(Xt = Xtrain,
                Yt = Ytrain,
                Om = Om,
                gam = gam ,
                lam = lam,
                q = q,
                method = method,
                control = control)

    # Do the predictions on the test set
    preds <- predict(object = res, newdata = Xtest)



