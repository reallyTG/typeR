library(SemiMarkov)


### Name: semiMarkov
### Title: Parametric estimation in multi-state semi-Markov models
### Aliases: semiMarkov SemiMarkov
### Keywords: documentation

### ** Examples


## No test: 

## Asthma control data
data(asthma)

## Definition of the model:  states, names, possible transtions and waiting time 
## distributions
states_1 <- c("1","2","3")
mtrans_1 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_1[1, 2:3] <- c("E","E")
mtrans_1[2, c(1,3)] <- c("E","E")
mtrans_1[3, c(1,2)] <- c("W","E")

## semi-Markov model without covariates
fit1 <- semiMarkov(data = asthma, states = states_1, mtrans = mtrans_1)

## semi-Markov model with one covariate 
## "BMI" affects all transitions
BMI <- as.data.frame(asthma$BMI)
fit2 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1)
## semi-Markov model with one covariate 
## "BMI" affects the transitions "1->3" and "3->1"
fit3 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1,
                   cov_tra = list(c("13","31")))

## semi-Markov model with two covariates 
## "BMI" affects the transitions "1->3" and "3->1"
## "Sex" affects the transition "3->1"
SEX <- as.data.frame(asthma$Sex)
fit4 <- semiMarkov(data = asthma, cov = as.data.frame(cbind(BMI,SEX)),
                   states = states_1, mtrans = mtrans_1,
                   cov_tra = list(c("13","31"),c("31")))
                   
## semi-Markov model using specific initial values      
## same model as "fit1" but using different initial values
## "fit5" and "fit6" are equivalent

init <- param.init(data = asthma, states = states_1, mtrans = mtrans_1,
        dist_init=c(rep(1.5,6),c(1.8)), proba_init=c(0.2,0.8,0.3,0.7,0.35,0.65))
fit5 <- semiMarkov(data = asthma, states = states_1, mtrans = mtrans_1,
                   dist_init=init$dist.init[,3], proba_init=init$proba.init[,3])
fit6 <- semiMarkov(data = asthma, states = states_1, mtrans = mtrans_1,
                   dist_init=c(rep(1.5,6),c(1.8)), 
                   proba_init=c(0.2,0.8,0.3,0.7,0.35,0.65))                   


## The Wald test null hypothesis is modified
## Wald statistics when testing nullity of distribution parameters
## and regression coefficients equal to -1
fit7 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1,
                   Wald_par = c(rep(0,7),rep(-1,6)))
            
## semi-Markov model with additional constraints 
## distribution parameters sigma for transition "1->3" = sigma for transition "2->1" 
fit8 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1,
                   eqfun = list(c("dist",2,3,1)))

## semi-Markov model with additional constraints 
## regression coefficients beta for transition "1->2" = beta for transition "2->1" 
##                                                    = beta for transition "2->3"  
fit9 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1,
                   eqfun = list(c("coef",1,3,1),c("coef",1,4,1)))

## semi-Markov model with additional constraints 
## regression coeficient beta for transition "1->2" belongs to [-0.2,0.2]
## and regression coeficient beta for transition "2->3" belongs to [-0.05,0.05]
fit10 <- semiMarkov(data = asthma, cov = BMI, states = states_1, mtrans = mtrans_1,
                    ineqLB = list(c("coef",1,-0.2),c("coef",4,-0.05)),
                    ineqUB = list(c("coef",1,0.2),c("coef",4,0.05)))

## End(No test)




