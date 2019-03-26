library(sprinter)


### Name: sprinter
### Title: Main function for building prognostic models by considering
###   interactions.
### Aliases: sprinter

### ** Examples


## Not run: 
##D ##---------------------------
##D ## Survival analysis
##D ##---------------------------
##D 
##D #############################
##D # Fit a Cox proportional hazards model by CoxBoost by considering 
##D # interactions after screening interactions by random forest
##D # system.time:
##D #   user  system elapsed 
##D # 370.97    2.32  374.31
##D # For a faster run set repetitions down!
##D #############################
##D 
##D # Create survival data with interactions:
##D simulation <- simul.int(287578,n = 200, p = 500,
##D                           beta.int = 1.0,
##D                           beta.main = 0.9, 
##D                           censparam = 1/20, 
##D                           lambda = 1/20)
##D data <- simulation$data
##D 
##D # Showing True Effects:
##D simulation$info
##D 
##D # Perform the sprinter approach:
##D set.seed(123)
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
##D                     parallel = FALSE)
##D summary(testcb)
##D 
##D 
##D 
##D ##########
##D # Fit a Cox proportional hazards model by considering 
##D # interactions after screening interactions by random forest
##D # and selecting relevant effects by univariate Cox regression: 
##D # system.time:
##D #   user  system elapsed 
##D # 374.50    1.53  376.68 
##D # For a faster run set repetitions down!
##D ##########
##D 
##D # Create survival data with interactions:
##D data <- simul.int(287578,n = 200, p = 500,
##D                           beta.int = 1.0,
##D                           beta.main = 0.9, 
##D                           censparam = 1/20, 
##D                           lambda = 1/20)[[1]]
##D 
##D 
##D # Perform the sprinter approach:
##D set.seed(123)
##D testunicox <- sprinter( x=data[,1:500],  
##D                     time = data$obs.time,
##D                     status= data$obs.status,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.uniCox, 
##D                     fit.final = fit.uniCox, 
##D                     parallel = FALSE)
##D 
##D 
##D summary(testunicox)
##D 
##D 
##D # true coefficients:
##D # ID1   ID2   ID5:ID6   ID7:ID8
##D # 0.9  -0.9      1         -1
##D 
##D 
##D ##---------------------------
##D ## Continuous outcome
##D ##---------------------------
##D 
##D # selection of main effects by univariate generalized 
##D # linear models and pre-selections of interactions 
##D # by random forest:
##D sprinter.glm.rf.con <- sprinter( x=data[,1:500],  
##D                     time = data$obs.time,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.uniGlm, 
##D                     fit.final = fit.uniGlm, 
##D                     parallel = FALSE)
##D 
##D # selection of main effects by univariate generalized 
##D # linear models and pre-selections of interactions 
##D # by logic regression:
##D sprinter.glm.logicR.con <- sprinter( x=data[,1:500],  
##D                     time = data$obs.time,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.uniGlm,
##D                     screen.inter = fit.logicReg,
##D                     fit.final = fit.uniGlm, 
##D                     args.screen.inter = list(type = 2),
##D                     parallel = FALSE)
##D 
##D # selection of main effects by GAMBoost 
##D #  and pre-selections of interactions 
##D # by random forest:
##D sprinter.gamboost.rf.con <- sprinter( x=data[,1:500],  
##D                     time = data$obs.time,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.GAMBoost, 
##D                     args.screen.main = list(stepno = 10),
##D                     fit.final = fit.GAMBoost, 
##D                     parallel = FALSE)
##D                     
##D 
##D ##---------------------------
##D ## Binary outcome 
##D ##---------------------------
##D x <- matrix(runif(200*500,min=-1,max=1),200,500)  
##D colnames(x) <- paste('ID', 1:500, sep = '')
##D eta <- -0.5 + 2*x[,1] - 2*x[,3] + 2 * x[,3]*x[,4]
##D y <- rbinom(200,1,binomial()$linkinv(eta))
##D 
##D 
##D # selection of main effects by univariate generalized 
##D # linear models and pre-selections of interactions 
##D # by random forest:
##D sprinter.glm.rf.bin <- sprinter( x=x[,1:500],  
##D                     time = y,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.uniGlm, 
##D                     fit.final = fit.uniGlm, 
##D                     args.screen.main = list(family = binomial()),
##D                     parallel = FALSE)
##D                     
##D # selection of main effects by univariate generalized 
##D # linear models and pre-selections of interactions 
##D # by logic regression:
##D sprinter.glm.logicR.bin <- sprinter( x=x[,1:500],  
##D                     time = y,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.uniGlm,
##D                     screen.inter = fit.logicReg,
##D                     fit.final = fit.uniGlm, 
##D                     args.screen.inter = list(type = 3),
##D                     parallel = FALSE)
##D      
##D 
##D # selection of main effects by GAMBoost and pre-selection of 
##D # interactions by random forest:
##D 
##D sprinter.GAMBoost.rf.bin <- sprinter( x=x,  
##D                     time = y,
##D                     repetitions = 10,
##D                     mandatory = c("ID1","ID2"),
##D                     n.inter.candidates = 1000, 
##D                     screen.main = fit.GAMBoost, 
##D                     fit.final = fit.GAMBoost, 
##D                     args.screen.main = list(family = binomial()),
##D                     parallel = FALSE)
##D                     
##D                
## End(Not run)



