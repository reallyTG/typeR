library(BaBooN)


### Name: MI.inference
### Title: Multiple Imputation inference
### Aliases: MI.inference

### ** Examples

## Not run: 
##D ### example 1
##D n <- 100
##D x1 <- round(runif(n,0.5,3.5))
##D x2 <- round(runif(n,0.5,4.5))
##D x3 <- runif(n,1,6)
##D y1 <- round(x1-0.25*x2+0.5*x3+rnorm(n,0,1))
##D y1 <- ifelse(y1<2,2,y1)
##D y1 <- as.factor(ifelse(y1>4,5,y1))
##D y2 <- x3+rnorm(n,0,2)
##D y3 <- as.factor(ifelse(x2+rnorm(n,0,2)>2,1,0))
##D mis1 <- sample(100,20)
##D mis2 <- sample(100,30)
##D mis3 <- sample(100,25)
##D data1 <- data.frame("x1"=x1,"x2"=x2,"x3"=x3,
##D                     "y1"=y1,"y2"=y2,"y3"=y3)
##D is.na(data1$y1[mis1]) <- TRUE
##D is.na(data1$y2[mis2]) <- TRUE
##D is.na(data1$y3[mis3]) <- TRUE
##D imputed.data <- BBPMM(data1, M=5, nIter=5)
##D 
##D MI.m.meany2.hat <- sapply(imputed.data$impdata,
##D                           FUN=function(x) mean(x$y2))
##D                           
##D MI.v.meany2.hat <- sapply(imputed.data$impdata,
##D                           FUN=function(x) var(x$y2)/length(x$y2))
##D 
##D ### MI inference
##D MI.y2 <- MI.inference(MI.m.meany2.hat,
##D                       MI.v.meany2.hat, alpha=0.05)
##D 
##D MI.y2$MI.Est
##D MI.y2$MI.Var
##D 
##D 
##D ################################################################
##D ### example 2: a small simulation example
##D 
##D ### simple additional function to calculate coverages:         #
##D 
##D coverage <- function(value, bounds) {
##D   ifelse(min(bounds) <= value && max(bounds) >= value, 1, 0)
##D }
##D ### value            : true value                              #
##D ### bounds           : vector with two elements (upper and     #
##D ###                    lower bound of the CI)                  #
##D 
##D ### sample size
##D n <- 100
##D ### true value for the mean of y2
##D m.y2 <- 3.5
##D y2.cover <- vector(length=n)
##D set.seed(1000)
##D 
##D ### 100 data generations
##D time1 <- Sys.time()
##D for (i in 1:100) {
##D   x1 <- round(runif(n,0.5,3.5))
##D   x2 <- round(runif(n,0.5,4.5))
##D   x3 <- runif(n,1,6)
##D   y1 <- round(x1-0.25*x2+0.5*x3+rnorm(n,0,1))
##D   y1 <- ifelse(y1<2,2,y1)
##D   y1 <- as.factor(ifelse(y1>4,5,y1))
##D   y2 <- x3+rnorm(n,0,2)
##D   y3 <- as.factor(ifelse(x2+rnorm(n,0,2)>2,1,0))
##D   mis1 <- sample(n,20)
##D   mis2 <- sample(n,30)
##D   mis3 <- sample(n,25)
##D   data1 <- data.frame("x1"=x1,"x2"=x2,"x3"=x3,
##D                       "y1"=y1,"y2"=y2,"y3"=y3)
##D   is.na(data1$y1[mis1]) <- TRUE
##D   is.na(data1$y2[mis2]) <- TRUE
##D   is.na(data1$y3[mis3]) <- TRUE
##D   
##D   sim.imp <- BBPMM(data1, M=3, nIter=2,
##D                    stepmod="", verbose=FALSE)
##D 
##D   MI.m.meany2.hat <- sapply(sim.imp$impdata,
##D                             FUN=function(x) mean(x$y2))
##D 
##D   MI.v.meany2.hat <- sapply(sim.imp$impdata,
##D                             FUN=function(x) 
##D                             var(x$y2)/length(x$y2))
##D ### MI inference
##D   MI.y2 <- MI.inference(MI.m.meany2.hat, MI.v.meany2.hat,
##D                         alpha=0.05)
##D 
##D   y2.cover[i] <- coverage(m.y2, c(MI.y2$CI.low,MI.y2$CI.up))
##D }
##D time2 <- Sys.time()
##D difftime(time2, time1, unit="secs")
##D 
##D ### coverage estimator (alpha=0.05):
##D mean(y2.cover)
##D 
## End(Not run)



