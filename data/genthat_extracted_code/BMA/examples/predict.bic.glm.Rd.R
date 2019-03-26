library(BMA)


### Name: predict.bic.glm
### Title: Predict function for Bayesian Model Averaging for generalized
###   linear models.
### Aliases: predict.bic.glm
### Keywords: regression models

### ** Examples


## Not run: 
##D # Example 1 (Gaussian)
##D 
##D      library(MASS)
##D      data(UScrime)
##D 
##D      f <- formula(log(y) ~  log(M)+So+log(Ed)+log(Po1)+log(Po2)+
##D             log(LF)+log(M.F)+log(Pop)+log(NW)+log(U1)+log(U2)+
##D             log(GDP)+log(Ineq)+log(Prob)+log(Time))
##D 
##D      bic.glm.crimeT <- bic.glm(f, data = UScrime, 
##D                                glm.family = gaussian())
##D      predict(bic.glm.crimeT, newdata = UScrime)
##D 
##D      bic.glm.crimeF <- bic.glm(f, data = UScrime, 
##D                                glm.family = gaussian(),
##D                                factor.type = FALSE)
##D      predict(bic.glm.crimeF, newdata = UScrime)
## End(Not run)

## Not run: 
##D # Example 2 (binomial)
##D 
##D      library(MASS)
##D      data(birthwt)
##D 
##D      y <- birthwt$lo
##D      x <- data.frame(birthwt[,-1])
##D      x$race <- as.factor(x$race)
##D      x$ht <- (x$ht>=1)+0
##D      x <- x[,-9]
##D      x$smoke <- as.factor(x$smoke)
##D      x$ptl <- as.factor(x$ptl)
##D      x$ht  <- as.factor(x$ht)
##D 
##D      x$ui <- as.factor(x$ui)
##D 
##D      bic.glm.bwT <- bic.glm(x, y, strict = FALSE, OR = 20,
##D                             glm.family="binomial",  
##D                             factor.type=TRUE)
##D      predict( bic.glm.bwT, newdata = x)
##D 
##D      bic.glm.bwF <- bic.glm(x, y, strict = FALSE, OR = 20,
##D                             glm.family="binomial",  
##D                             factor.type=FALSE)
##D      predict( bic.glm.bwF, newdata = x)
## End(Not run)

## Not run: 
##D # Example 3 (Gaussian)
##D 
##D      library(MASS)
##D      data(anorexia)
##D 
##D      anorexia.formula <- formula(Postwt ~ Prewt+Treat+offset(Prewt))
##D 
##D      bic.glm.anorexiaF <- bic.glm( anorexia.formula, data=anorexia,
##D                        glm.family="gaussian", factor.type=FALSE)
##D      predict( bic.glm.anorexiaF, newdata=anorexia)
##D 
##D      bic.glm.anorexiaT <- bic.glm( anorexia.formula, data=anorexia,
##D                            glm.family="gaussian", factor.type=TRUE)
##D      predict( bic.glm.anorexiaT, newdata=anorexia)
## End(Not run)

## Not run: 
##D # Example 4 (Gamma)
##D 
##D      library(survival)
##D      data(veteran)
##D 
##D      surv.t <- veteran$time
##D      x <- veteran[,-c(3,4)]
##D      x$celltype <- factor(as.character(x$celltype))
##D      sel<- veteran$status == 0
##D      x <- x[!sel,]
##D      surv.t <- surv.t[!sel]
##D 
##D      bic.glm.vaT <- bic.glm(x, y=surv.t, 
##D                             glm.family=Gamma(link="inverse"),
##D                             factor.type=TRUE)
##D      predict( bic.glm.vaT, x)
##D 
##D      bic.glm.vaF <- bic.glm(x, y=surv.t, 
##D                             glm.family=Gamma(link="inverse"),
##D                             factor.type=FALSE)
##D      predict( bic.glm.vaF, x)
## End(Not run)

# Example 5 (poisson - Yates teeth data)

     x <- rbind.data.frame(c(0, 0, 0),
                           c(0, 1, 0),
                           c(1, 0, 0),
                           c(1, 1, 1))

     y <- c(4, 16, 1, 21)
     n <- c(1,1,1,1)

     bic.glm.yatesF <- bic.glm( x, y, glm.family=poisson(),
                               weights=n, factor.type=FALSE)

     predict( bic.glm.yatesF, x)

## Not run: 
##D # Example 6 (binomial - Venables and Ripley)
##D 
##D     ldose <- rep(0:5, 2)
##D     numdead <- c(1, 4, 9, 13, 18, 20, 0, 2, 6, 10, 12, 16)
##D     sex <- factor(rep(c("M", "F"), c(6, 6)))
##D     SF <- cbind(numdead, numalive=20-numdead) 
##D 
##D     budworm <- cbind.data.frame(ldose = ldose, numdead = numdead,
##D                                 sex = sex, SF = SF)
##D     budworm.formula <- formula(SF ~ sex*ldose)
##D 
##D     bic.glm.budwormF <- bic.glm( budworm.formula, data=budworm,
##D                    glm.family="binomial", factor.type=FALSE)
##D     predict(bic.glm.budwormF, newdata=budworm)
##D 
##D     bic.glm.budwormT <- bic.glm( budworm.formula, data=budworm,
##D                       glm.family="binomial", factor.type=TRUE)
##D     predict(bic.glm.budwormT, newdata=budworm)
## End(Not run)



