library(tabuSearch)


### Name: tabuSearch
### Title: R based tabu search algorithm for binary configurations
### Aliases: tabuSearch

### ** Examples


# A simple example


evaluateSimple <- function(th)return(1)

result <- tabuSearch(size = 20, iters = 100, objFunc = evaluateSimple) 


## Not run: 
##D # simulate 10-d data: 150 samples from 3 bivariate normals and 8 noise variables. 
##D # Variable selection should recover the first two variables
##D 
##D 
##D 
##D 
##D library(MASS)
##D NF <- 10
##D G <- 3
##D NTR <- 50
##D NTE <- 50
##D 
##D muA <- c(1,3)
##D SigmaA <- matrix(c(0.2, 0.04, 0.04, 0.2), 2, 2)
##D muB <- c(1.2,1)
##D SigmaB <- matrix(c(0.1, -0.06, 0.004, 0.2), 2, 2)
##D muC <- c(3,2)
##D SigmaC <- matrix(c(0.2, 0.004, 0.004, 0.2), 2, 2)
##D 
##D train <- rbind(mvrnorm(NTR, muA, SigmaA), mvrnorm(NTR, muB, SigmaB), mvrnorm(NTR, muC, SigmaC))
##D test <- rbind(mvrnorm(NTE, muA, SigmaA), mvrnorm(NTE, muB, SigmaB), mvrnorm(NTE, muC, SigmaC))
##D 
##D train <- cbind(train, matrix(runif(G * NTR * (NF - 2), 0, 4), nrow = G * NTR, ncol = (NF-2)))
##D test <- cbind(test, matrix(runif(G * NTE * (NF - 2), 0, 4), nrow = G * NTE, ncol = (NF-2)))
##D 
##D wtr <-  as.factor(rep(1:G, each = NTR))
##D wte <-  as.factor(rep(1:G, each = NTE))
##D pairs(train, col = wtr)
##D 
##D 
##D 
##D 
##D library(e1071)
##D 
##D evaluate <- function(th){ 
##D     if (sum(th) == 0)return(0)             
##D     model <- svm(train[ ,th==1], wtr , gamma = 0.1)
##D     pred <- predict(model, test[ ,th==1])
##D     csRate <- sum(pred == wte)/NTE 
##D     penalty <- (NF - sum(th))/NF 
##D     return(csRate + penalty)
##D }  
##D  
##D res <- tabuSearch(size = NF, iters = 50, objFunc = evaluate, config = matrix(1,1,NF),
##D listSize = 5, nRestarts = 4) 
##D 
##D 
##D plot(res)
##D plot(res, "tracePlot")
##D 
##D summary(res, verbose = TRUE)
## End(Not run)



