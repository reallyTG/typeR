library(BMA)


### Name: bic.glm
### Title: Bayesian Model Averaging for generalized linear models.
### Aliases: bic.glm bic.glm.data.frame bic.glm.matrix bic.glm.formula
### Keywords: regression models

### ** Examples


## Not run: 
##D ### logistic regression
##D library("MASS")
##D data(birthwt)
##D y<- birthwt$lo
##D x<- data.frame(birthwt[,-1])
##D x$race<- as.factor(x$race)
##D x$ht<- (x$ht>=1)+0
##D x<- x[,-9]
##D x$smoke <- as.factor(x$smoke)
##D x$ptl<- as.factor(x$ptl)
##D x$ht <- as.factor(x$ht)
##D x$ui <- as.factor(x$ui)
##D 
##D glm.out.FT <- bic.glm(x, y, strict = FALSE, OR = 20, 
##D                       glm.family="binomial", factor.type=TRUE)
##D summary(glm.out.FT)
##D imageplot.bma(glm.out.FT)
##D 
##D glm.out.FF <- bic.glm(x, y, strict = FALSE, OR = 20, 
##D                       glm.family="binomial", factor.type=FALSE)
##D summary(glm.out.FF)
##D imageplot.bma(glm.out.FF)
##D 
##D glm.out.TT <- bic.glm(x, y, strict = TRUE, OR = 20, 
##D                       glm.family="binomial", factor.type=TRUE)
##D summary(glm.out.TT)
##D imageplot.bma(glm.out.TT)
##D 
##D glm.out.TF <- bic.glm(x, y, strict = TRUE, OR = 20, 
##D                       glm.family="binomial", factor.type=FALSE)
##D summary(glm.out.TF)
##D imageplot.bma(glm.out.TF)
## End(Not run)

## Not run: 
##D ### Gamma family 
##D library(survival)
##D data(veteran)
##D surv.t<- veteran$time
##D x<- veteran[,-c(3,4)]
##D x$celltype<- factor(as.character(x$celltype))
##D sel<- veteran$status == 0
##D x<- x[!sel,]
##D surv.t<- surv.t[!sel]
##D 
##D glm.out.va <- bic.glm(x, y=surv.t, glm.family=Gamma(link="inverse"),
##D     factor.type=FALSE)
##D summary(glm.out.va)
##D imageplot.bma(glm.out.va)
##D plot(glm.out.va)
## End(Not run)

### Poisson family
### Yates (teeth) data. 

x<- rbind(
    c(0, 0, 0),
    c(0, 1, 0),
    c(1, 0, 0),
    c(1, 1, 1))

y<-c(4, 16, 1, 21)
n<-c(1,1,1,1)

models<- rbind(
    c(1, 1, 0),
    c(1, 1, 1))

glm.out.yates <- bic.glm( x, y, n, glm.family = poisson(), 
                         factor.type=FALSE) 
summary(glm.out.yates)

## Not run: 
##D ### Gaussian
##D library(MASS)
##D data(UScrime)
##D f <- formula(log(y) ~  log(M)+So+log(Ed)+log(Po1)+log(Po2)+log(LF)+
##D                        log(M.F)+ log(Pop)+log(NW)+log(U1)+log(U2)+
##D                        log(GDP)+log(Ineq)+log(Prob)+log(Time))
##D glm.out.crime <- bic.glm(f, data = UScrime, glm.family = gaussian()) 
##D summary(glm.out.crime)
##D # note the problems with the estimation of the posterior standard 
##D # deviation (compare with bicreg example)
## End(Not run)




