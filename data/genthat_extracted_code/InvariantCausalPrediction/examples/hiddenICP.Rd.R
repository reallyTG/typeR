library(InvariantCausalPrediction)


### Name: hiddenICP
### Title: Invariant Causal Prediction with hidden variables
### Aliases: hiddenICP
### Keywords: Causality Regression Hidden Variables

### ** Examples

 ##########################################
 ####### 1st example:
 ####### Simulate data with interventions
      set.seed(1)
    ## sample size n
      n <- 2000
    ## 4 predictor variables
      p  <- 4
    ## simulate as independent Gaussian variables
      X <- matrix(rnorm(n*p),nrow=n)
    ## divide data into observational (ExpInd=1) and interventional (ExpInd=2)
      ExpInd <- c(rep(1,n/2),rep(2,n/2))
    ## for interventional data (ExpInd==2): change distribution
      nI <- sum(ExpInd==2)
      X[ExpInd==2,] <- X[ExpInd==2,] + matrix( 5*rt( nI*p,df=3),ncol=p)
      ## add hidden variables
      W <- rnorm(n) * 5
      X <- X + outer(W, rep(1,4))
      
      ## first two variables are the causal predictors of Y
      beta <- c(1,1,0,0)
    ## response variable Y
      Y <- as.numeric(X%*%beta - 2*W + rnorm(n))
       

####### Compute "hidden Invariant Causal Prediction" Confidence Intervals
      icp <- hiddenICP(X,Y,ExpInd,alpha=0.01)
      print(icp)

 ###### Print point estimates and points in the confidence interval closest to 0
      print(icp$betahat)
      print(icp$maximinCoefficients)
      cat("true coefficients are:", beta)

 #### compare with coefficients from a linear model
      cat("coefficients from linear model:")
      print(summary(lm(Y ~ X-1)))



      
##########################################
####### 2nd example:
####### Simulate model X -> Y -> Z with hidden variables, trying to
######  estimate causal effects from (X,Z) on Y
      set.seed(1)
    ## sample size n
      n <- 10000
    ## simulate as independent Gaussian variables
      W <- rnorm(n)
      noiseX <- rnorm(n)
      noiseY <- rnorm(n)
      noiseZ <- rnorm(n)
    ## divide data into observational (ExpInd=1) and interventional (ExpInd=2)
      ExpInd <- c(rep(1,n/2),rep(2,n/2))
      noiseX[ which(ExpInd==2)] <- noiseX[ which(ExpInd==2)] * 5
      noiseZ[ which(ExpInd==2)] <- noiseZ[ which(ExpInd==2)] * 3

    ## simulate equilibrium data
      beta <- -0.5
      alpha <- 0.9
      X <- noiseX + 3*W
      Y <- beta* X + noiseY + 3*W
      Z <- alpha*Y + noiseZ
    

 ####### Compute "Invariant Causal Prediction" Confidence Intervals
      icp <- hiddenICP(cbind(X,Z),Y,ExpInd,alpha=0.1)
      print(icp)

 ###### Print/plot/show summary of output (truth here is (beta,0))
      print(signif(icp$betahat,3))
      print(signif(icp$maximinCoefficients,3))
      cat("true coefficients are:", beta,0)

 #### compare with coefficients from a linear model
      cat("coefficients from linear model:")
      print(summary(lm(Y ~ X + Z -1)))   
  



