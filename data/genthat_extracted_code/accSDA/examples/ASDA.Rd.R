library(accSDA)


### Name: ASDA
### Title: Accelerated Sparse Discriminant Analysis
### Aliases: ASDA ASDA.default

### ** Examples

    set.seed(123)
    # Prepare training and test set
    train <- c(1:40,51:90,101:140)
    Xtrain <- iris[train,1:4]
    nX <- normalize(Xtrain)
    Xtrain <- nX$Xc
    Ytrain <- iris[train,5]
    Xtest <- iris[-train,1:4]
    Xtest <- normalizetest(Xtest,nX)
    Ytest <- iris[-train,5]

    # Define parameters for Alternating Direction Method of Multipliers (SDAD)
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

    # Can also just use the defaults, which is Accelerated Proximal Gradient (SDAAP):
    resDef <- ASDA(Xtrain,Ytrain)

    # Some example on simulated data
    # Generate Gaussian data on three classes with plenty of redundant variables

    # This example shows the basic steps on how to apply this to data, i.e.:
    #  1) Setup training data
    #  2) Normalize
    #  3) Train
    #  4) Predict
    #  5) Plot projected data
    #  6) Accuracy on test set

    P <- 300 # Number of variables
    N <- 50 # Number of samples per class

    # Mean for classes, they are zero everywhere except the first 3 coordinates
    m1 <- rep(0,P)
    m1[1] <- 3

    m2 <- rep(0,P)
    m2[2] <- 3

    m3 <- rep(0,P)
    m3[3] <- 3

    # Sample dummy data
    Xtrain <- rbind(MASS::mvrnorm(n=N,mu = m1, Sigma = diag(P)),
                   MASS::mvrnorm(n=N,mu = m2, Sigma = diag(P)),
                   MASS::mvrnorm(n=N,mu = m3, Sigma = diag(P)))

    Xtest <- rbind(MASS::mvrnorm(n=N,mu = m1, Sigma = diag(P)),
                   MASS::mvrnorm(n=N,mu = m2, Sigma = diag(P)),
                   MASS::mvrnorm(n=N,mu = m3, Sigma = diag(P)))

    # Generate the labels
    Ytrain <- factor(rep(1:3,each=N))
    Ytest <- Ytrain

    # Normalize the data
    Xt <- accSDA::normalize(Xtrain)
    Xtrain <- Xt$Xc # Use the centered and scaled data
    Xtest <- accSDA::normalizetest(Xtest,Xt)

    # Train the classifier and increase the sparsity parameter from the default
    # so we penalize more for non-sparse solutions.
    res <- accSDA::ASDA(Xtrain,Ytrain,lam=0.01)

    # Plot the projected training data, it is projected to
    # 2-dimension because we have 3 classes. The number of discriminant
    # vectors is maximum number of classes minus 1.
    XtrainProjected <- Xtrain%*%res$beta

    plot(XtrainProjected[,1],XtrainProjected[,2],col=Ytrain)

    # Predict on the test data
    preds <- predict(res, newdata = Xtest)

    # Plot projected test data with predicted and correct labels
    XtestProjected <- Xtest%*%res$beta

    plot(XtestProjected[,1],XtestProjected[,2],col=Ytest,
         main="Projected test data with original labels")
    plot(XtestProjected[,1],XtestProjected[,2],col=preds$class,
         main="Projected test data with predicted labels")

    # Calculate accuracy
    sum(preds$class == Ytest)/(3*N) # We have N samples per class, so total 3*N




