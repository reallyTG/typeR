library(SemiMarkov)


### Name: hazard
### Title: Computes hazard rates using an object of class 'semiMarkov' or
###   'param.init'
### Aliases: hazard
### Keywords: documentation

### ** Examples


## No test: 

## Asthma control data
data(asthma)

## Definition of the model:  states, names, 
# possible transtions and waiting times distributions
states_1 <- c("1","2","3")
mtrans_1 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_1[1, 2:3] <- c("E","E")
mtrans_1[2, c(1,3)] <- c("E","E")
mtrans_1[3, c(1,2)] <- c("W","E")

## semi-Markov model without covariates
fit1 <- semiMarkov(data = asthma, states = states_1, mtrans = mtrans_1)

## Hazard rates of waiting time
alpha1 <- hazard(fit1)
plot(alpha1)

## Hazard rates of the semi-Markov process
lambda1 <- hazard(fit1, type = "lambda")
plot(lambda1)

## Defining a vector of equally distributed times 
alpha2 <- hazard(fit1, s=0, t=3, Length=300)
plot(alpha2)

## Considering times observed in the data set
alpha3 <- hazard(fit1, time=sort(unique(asthma$time)))
plot(alpha3)

## semi-Markov model with a covariate "BMI"
fit2 <- semiMarkov(data = asthma, cov = as.data.frame(asthma$BMI), 
        states = states_1, mtrans = mtrans_1)

## Time fixed covariate
## Covariate equal to 0 and 1 for each transition
alpha4 <- hazard(fit2)
alpha5 <- hazard(fit2, cov=1)
plot(alpha4,alpha5)

## Time dependent covariate 
## Suppose that the covariate value is known for all times values
Time<-sort(unique(asthma$time))             # observed times in ascending order
Cov1<-sort(rbinom(length(Time), 1, 0.3))    # simulation of binary covariate
Cov2<-sort(rexp(length(Time), 5))           # simulation of numeric covariate
alpha6 <- hazard(fit2, time=Time, cov=Cov1)
plot(alpha6)
alpha7 <- hazard(fit2, time=Time, cov=Cov2)
plot(alpha7)

## semi-Markov model with two covariates 
## "BMI" affects transitions "1->3" and "3->1"
## "Sex" affects transition "3->1"
SEX <- as.data.frame(asthma$Sex)
BMI <- as.data.frame(asthma$BMI)
fit3 <- semiMarkov(data = asthma, cov = as.data.frame(cbind(BMI,SEX)),
                   states = states_1, mtrans = mtrans_1,
                   cov_tra = list(c("13","31"),c("31")))
alpha8 <- hazard(fit3, cov=c(0,0))
alpha9 <- hazard(fit3, cov=c(1,1))
plot(alpha8,alpha9)

## End(No test)



