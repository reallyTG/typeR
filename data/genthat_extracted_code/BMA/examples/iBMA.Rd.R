library(BMA)


### Name: iBMA
### Title: Iterated Bayesian Model Averaging variable selection for
###   generalized linear models, linear models or survival models.
### Aliases: iBMA iBMA.glm iBMA.bicreg iBMA.surv iBMA.glm.data.frame
###   iBMA.glm.matrix iBMA.glm.iBMA.intermediate.glm iBMA.bicreg.data.frame
###   iBMA.bicreg.matrix iBMA.bicreg.iBMA.intermediate.bicreg
###   iBMA.surv.data.frame iBMA.surv.matrix
###   iBMA.surv.iBMA.intermediate.surv
### Keywords: regression survival

### ** Examples


## Not run: 
##D ############ iBMA.glm
##D library("MASS")
##D data(birthwt)
##D  y<- birthwt$lo
##D  x<- data.frame(birthwt[,-1])
##D  x$race<- as.factor(x$race)
##D  x$ht<- (x$ht>=1)+0
##D  x<- x[,-9]
##D  x$smoke <- as.factor(x$smoke)
##D  x$ptl<- as.factor(x$ptl)
##D  x$ht <- as.factor(x$ht)
##D  x$ui <- as.factor(x$ui)
##D 
##D ### add 41 columns of noise
##D noise<- matrix(rnorm(41*nrow(x)), ncol=41)
##D colnames(noise)<- paste('noise', 1:41, sep='')
##D x<- cbind(x, noise)
##D 
##D iBMA.glm.out<- iBMA.glm( x, y, glm.family="binomial", 
##D                          factor.type=FALSE, verbose = TRUE, 
##D                          thresProbne0 = 5 )
##D summary(iBMA.glm.out)
## End(Not run)

## Not run: 
##D ################## iBMA.surv
##D library(survival)
##D data(veteran)
##D 
##D surv.t<- veteran$time
##D cens<- veteran$status
##D veteran$time<- NULL
##D veteran$status<- NULL
##D lvet<- nrow(veteran)
##D invlogit<- function(x) exp(x)/(1+exp(x))
##D # generate random noise, 34 uniform variables 
##D # and 10 factors each with 4 levels
##D X <- data.frame(matrix(runif(lvet*34), ncol=34), 
##D                matrix(letters[1:6][(rbinom(10*lvet, 3, .5))+1], 
##D                ncol = 10))
##D colnames(X) <- c(paste("u",1:34, sep=""),paste("C",1:10, sep=""))
##D veteran_plus_noise<- cbind(veteran, X)
##D 
##D 
##D test.iBMA.surv <- iBMA.surv(x = veteran_plus_noise, 
##D                             surv.t = surv.t, cens = cens, 
##D                             thresProbne0 = 5, maxNvar = 30, 
##D                             factor.type = TRUE, verbose = TRUE, 
##D                             nIter = 100)
##D 
##D test.iBMA.surv
##D summary(test.iBMA.surv)
## End(Not run)

## Not run: 
##D ############ iBMA.bicreg ... degenerate example
##D library(MASS)
##D data(UScrime)
##D UScrime$M<- log(UScrime$M); UScrime$Ed<- log(UScrime$Ed); 
##D UScrime$Po1<- log(UScrime$Po1); UScrime$Po2<- log(UScrime$Po2); 
##D UScrime$LF<- log(UScrime$LF); UScrime$M.F<- log(UScrime$M.F)
##D UScrime$Pop<- log(UScrime$Pop); UScrime$NW<- log(UScrime$NW); 
##D UScrime$U1<- log(UScrime$U1); UScrime$U2<- log(UScrime$U2); 
##D UScrime$GDP<- log(UScrime$GDP); UScrime$Ineq<- log(UScrime$Ineq)
##D UScrime$Prob<- log(UScrime$Prob); UScrime$Time<- log(UScrime$Time) 
##D noise<- matrix(rnorm(35*nrow(UScrime)), ncol=35)
##D colnames(noise)<- paste('noise', 1:35, sep='')
##D UScrime_plus_noise<- cbind(UScrime, noise)
##D 
##D y<- UScrime_plus_noise$y
##D UScrime_plus_noise$y <- NULL
##D 
##D # run 2 iterations and examine results
##D iBMA.bicreg.crime <- iBMA.bicreg( x = UScrime_plus_noise, 
##D  Y = y, thresProbne0 = 5, verbose = TRUE, maxNvar = 30, nIter = 2)
##D summary(iBMA.bicreg.crime)
##D orderplot(iBMA.bicreg.crime)
## End(Not run)

## Not run: 
##D # run from current state until completion
##D iBMA.bicreg.crime <- iBMA.bicreg( iBMA.bicreg.crime, nIter = 200)
##D summary(iBMA.bicreg.crime)
##D orderplot(iBMA.bicreg.crime)
## End(Not run)

set.seed(0)
x <- matrix( rnorm(50*30), 50, 30)
lp <- apply( x[,1:5], 1, sum)
iBMA.bicreg.ex <- iBMA.bicreg( x = x,  Y = lp, thresProbne0 = 5, maxNvar = 20)

explp <- exp(lp)
prob <- explp/(1+explp)
y=rbinom(n=length(prob),prob=prob,size=1)
iBMA.glm.ex <- iBMA.glm( x = x, Y = y, glm.family = "binomial",
                         factor.type = FALSE, thresProbne0 = 5, maxNvar = 20)

cat("\n\n CAUTION: iBMA.bicreg can give degenerate results when")
cat(" the number of predictor variables is large\n\n")





