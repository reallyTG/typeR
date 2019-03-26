library(SemiMarkov)


### Name: plot.hazard
### Title: Plot method for objects of class 'hazard'
### Aliases: plot.hazard
### Keywords: documentation

### ** Examples

## No test: 


## Asthma control data
data(asthma)

## Definition of the model:  states, names, possible transtions 
# and waiting times distributions
states_1 <- c("1","2","3")
mtrans_1 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_1[1, 2:3] <- c("E","E")
mtrans_1[2, c(1,3)] <- c("E","E")
mtrans_1[3, c(1,2)] <- c("W","E")
fit <- semiMarkov(data = asthma, states = states_1, mtrans = mtrans_1)
lambda<-hazard (fit, type = "lambda")

plot(lambda, names = c("lambda"),legend=FALSE)
plot(lambda, transitions = c("13","31"), names = c("lambda"),
legend.pos=c(2,0.09,2,0.4))

## semi-Markov model in each stratum of Severity
fit0 <- semiMarkov(data = asthma[asthma$Severity==0,],
        states = states_1, mtrans = mtrans_1)
fit1 <- semiMarkov(data = asthma[asthma$Severity==1,],
        states = states_1, mtrans = mtrans_1)
lambda0<-hazard (fit0, type = "lambda",s=0,t=5,Length=1000)
lambda1<-hazard (fit1, type = "lambda",s=0,t=5,Length=1000)
plot(lambda0,lambda1, names = c("lambda0", "lambda1"),
legend.pos=c(4,0.18,4,0.8,4,0.2,4,0.09,4,0.7,4,0.21))

## semi-Markov model with covariate "BMI"
fitcov <- semiMarkov(data = asthma, cov = as.data.frame(asthma$BMI),
        states = states_1, mtrans = mtrans_1)
lambda0<-hazard (fitcov, type = "lambda",cov = c(0))
lambda1<-hazard (fitcov, type = "lambda",cov = c(1))
plot(lambda0,lambda1, names = c("lambda0", "lambda1"))

## End(No test)



