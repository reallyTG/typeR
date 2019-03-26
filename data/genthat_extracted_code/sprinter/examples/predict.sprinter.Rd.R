library(sprinter)


### Name: predict.sprinter
### Title: Predict method for objects of class 'sprinter'
### Aliases: predict.sprinter

### ** Examples

simulation <- simul.int(287578,n = 200, p = 500,
                          beta.int = 1.0,
                          beta.main = 0.9, 
                          censparam = 1/20, 
                          lambda = 1/20)
data <- simulation$data    
simulation$info

set.seed(123)

## Not run: 
##D testcb <- sprinter( x=data[,1:500],  
##D                     time = data$obs.time,
##D                     status= data$obs.status,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.CoxBoost, 
##D                     fit.final = fit.CoxBoost, 
##D                     args.screen.main = list(seed=123,stepno = 10, K = 10, 
##D                                             criterion ='pscore', nu = 0.05),
##D                     parallel = FALSE, trace=TRUE)
##D summary(testcb)
##D 
##D 
##D # true coefficients:
##D # Clin.cov1   Clin.cov2   ID5:ID6   ID7:ID8
##D # 0.9         -0.9        1         -1
##D 
##D # Simulate New Data:
##D newSimulation <- simul.int(12345,n = 200, p = 500,
##D                           beta.int = 1.0,
##D                           beta.main = 0.9, 
##D                           censparam = 1/20, 
##D                           lambda = 1/20)
##D newdata <- newSimulation$data    
##D newSimulation$info
##D 
##D predict(testcb, newdata = newdata[,1:500]) 
## End(Not run)



