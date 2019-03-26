library(SemiMarkov)


### Name: param.init
### Title: Defines the initial values of parameters for a semi-Markov model
### Aliases: param.init
### Keywords: documentation

### ** Examples


## Asthma control data
data(asthma)

## Definition of the model:  states, names,
# possible transtions and waiting time distributions
states_1 <- c("1","2","3")
mtrans_1 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_1[1, 2:3] <- c("W","W")
mtrans_1[2, c(1,3)] <- c("EW","EW")
mtrans_1[3, c(1,2)] <- c("W","W")

## Default initial values in a model without covariates
init_1 <- param.init(data = asthma, states = states_1, mtrans = mtrans_1)

## Definition of initial values in a model without covariates
init_2 <- param.init(data = asthma, states = states_1, mtrans = mtrans_1,
          dist_init=c(rep(1.5,6),rep(1.8,6),rep(2,2)),
          proba_init=c(0.2,0.8,0.3,0.7,0.35,0.65))

## Default initial values with a covariate "Sex"
# influencing transitions " 1->2" and "3->2"
init_3 <- param.init(data = asthma, cov=as.data.frame(asthma$Sex),
          states = states_1, mtrans = mtrans_1, cov_tra=list(c("12","32")))

## Definition of initial values with a covariate "Sex" 
# influencing transitions " 1->2" and "3->2"
init_4 <- param.init(data = asthma, cov=as.data.frame(asthma$Sex),
          states = states_1, mtrans = mtrans_1, cov_tra=list(c("12","32")),
          dist_init=c(rep(1.5,6),rep(1.8,6),rep(2,2)),
          proba_init=c(0.2,0.8,0.3,0.7,0.35,0.65), coef_init=rep(0.3,2))
          
init_5 <- param.init(data = asthma, cov=as.data.frame(asthma$Sex),
          states = states_1, mtrans = mtrans_1, cov_tra=list(c("12","32")),
          coef_init=c(0.2,0.5))          

## Definition of initial values without dataset in an illness-death model
## 1 - healthy, 2 - illness, 3 - death
states_2 <- c("1","2","3")
mtrans_2 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_2[1,c(2,3)] <- c("E","W")
mtrans_2[2,c(1,3)] <- c("EW","EW")
init_6<-param.init(states=states_2, mtrans=mtrans_2, proba_init=c(0.7,0.3,0.2,0.8))




