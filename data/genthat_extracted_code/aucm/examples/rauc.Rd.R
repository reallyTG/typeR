library(aucm)


### Name: rauc
### Title: rauc
### Aliases: rauc nsv nsv.rauc plot.rauc vcov.rauc print.minQuad
### Keywords: auc roc area receiver

### ** Examples


## Not run: 
##D 
##D # options(path.svml = 'D:/downloaded_scientific_programs/svmlight') 
##D # options(path.svml ='~/bin/svmlight')
##D 
##D ###########################################################
##D # a linear example
##D 
##D dat = sim.dat.1(n=200,seed=1)
##D 
##D # convergence takes long, to pass CRAN check, set maxit=1 
##D 
##D fit1 = rauc (y~x1+x2, dat, lambda=2, kernel="linear", maxit=2)
##D #fit2 = rauc.linear (y~x1+x2, dat, lambda=2, verbose=TRUE)
##D #aux2=fit2$X %*% fit2$coefficients
##D #all(fit1$linear.combination-aux2<1e-2)
##D fit1$train.auc # 0.7206015
##D 
##D 
##D fit3 = rauc (y~x1+x2, dat, lambda=2, kernel="rbf", para=1, verbose=TRUE)
##D fit3$train.auc # 0.7773434
##D 
##D 
##D 
##D fit4 = svml (y~x1+x2, dat, kernel="r", fitted=FALSE, cost=1e4) 
##D fast.auc(predict(fit4, dat)$posterior[,1], dat$y) # 0.7921805
##D tune.svml(y~x1+x2, dat, kernel="r")
##D #        1        10       100      1000     10000     1e+05
##D #0.7027569 0.7254135 0.7517794 0.7653133 0.7921805 0.6674687
##D 
##D # glm derived score for comparision
##D fit.glm=glm(y~x1+x2, dat, family="binomial")
##D fast.auc(fit1$X %*% fit.glm$coef[-1], fit1$y) # 
##D 
##D # add outliers
##D dat = sim.dat.1(n=200,seed=1, add.outliers=TRUE)
##D 
##D fit3 = rauc (y~x1+x2, dat, lambda=2, kernel="rbf", para=1, verbose=TRUE)
##D fit3$train.auc # 0.7066667
##D 
##D fit4 = svml (y~x1+x2, dat, kernel="r", fitted=FALSE, cost=1e4) 
##D fast.auc(predict(fit4, dat)$posterior[,1], dat$y) # 0.6910101
##D tune.svml(y~x1+x2, dat, kernel="r")
##D #        1        10       100      1000     10000     1e+05 
##D #0.6485859 0.6705051 0.6722222 0.6767677 0.6910101 0.5007071
##D 
##D 
##D 
##D ###########################################################
##D # a nonlinear example
##D 
##D dat=skin.orange (n=100,seed=1,noise=FALSE)
##D dim(dat)
##D 
##D # nonlinear kernel fit
##D fit1 = rauc (y~x1+x2+x3+x4, dat, lambda=2, kernel="rbf", para=1, verbose=TRUE)
##D # glm fit
##D fit.glm=glm(y~x1+x2+x3+x4, dat, family="binomial")
##D # linear kernel fit
##D fit2 = rauc (y~x1+x2+x3+x4, dat, lambda=2, kernel="linear", start.method = "rlogit", verbose=TRUE)
##D 
##D # training data prediction
##D fast.auc(fit1$linear.combination, fit1$y)
##D fast.auc(fit1$X %*% fit.glm$coef[-1], fit1$y)
##D fast.auc(fit2$linear.combination, fit2$y)
##D 
##D # test data prediction
##D newdata=skin.orange (n=1000,seed=2,noise=FALSE)
##D fast.auc(predict(fit1, newdata), newdata$y)
##D fast.auc(as.matrix(subset(newdata, select=c(x1,x2,x3,x4))) %*% fit.glm$coef[-1], newdata$y)
##D fast.auc(predict(fit2, newdata), newdata$y)
##D 
##D 
##D 
##D ###### IMPROVEMENTS ####################################################
##D 
##D  
##D ## rank = 2 problem 
##D dat = sim.dat.1(n=300,seed=1,add.outliers = TRUE,std.dev = 1.0);fm = y~x1+x2
##D 
##D ## linear kernel and random working set selection - low rank (2) problem
##D ## setting initial alpha (to be passed to minQuad at each iteration in dca-loop) 
##D # to estimate from previous dca() iteration 
##D ## size of working set is automatically set
##D set.seed(100) 
##D fit.lin = rauc (fm, dat,lambda=.1,kernel="linear",
##D verbose=TRUE,maxit = 100,tol = 1e-5,
##D init.alpha.from.previous = TRUE,mem.efficient = TRUE,
##D minQuad.control = control.minQuad(
##D                             verbose = 1,maxit = 1e6,tol = 1e-4,
##D                             method = "tron",                            
##D                             working.set= "rv2wg")
##D )
##D 
##D ## 'rbf' kernel and random working set selection
##D ## low rank mapped to possibly infinite rank problem try larger working set 'q' set.seed(100) 
##D ## size of working set is set to q = 100
##D fit.rbf = rauc (fm, dat,lambda=.1,kernel="rbf",para = 1, verbose=TRUE,maxit = 100,tol = 1e-5,
##D init.alpha.from.previous = TRUE,mem.efficient = TRUE,
##D minQuad.control = control.minQuad(
##D                             verbose = 1,maxit = 1e6,tol = 1e-4,
##D                             q = 100,
##D                             method = "tron",                            
##D                             working.set= "rv2wg")
##D )
##D 
## End(Not run)
 



