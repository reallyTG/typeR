library(dyads)


### Name: p2
### Title: MCMC estimates for the p2 model
### Aliases: p2
### Keywords: p2 model

### ** Examples


# create a very small network with covariates for illustrative purposes
S <- c(1,0,1,0,1,1,0,1,0,1)
REC <- (S*-1)+1
D1 <- matrix(c(0,1,0,1,0,1,0,1,0,1,
              0,0,0,1,0,1,0,1,0,1,
              1,1,0,0,1,0,0,0,0,0,
              1,1,1,0,1,0,0,0,0,1,
              1,0,1,0,0,1,1,0,1,0,
              0,0,0,0,0,0,1,1,1,1,
              0,0,0,0,0,1,0,1,0,1,
              1,0,0,0,0,1,1,0,1,1,
              0,1,0,1,0,1,0,1,0,0,
              1,0,1,1,1,0,0,0,0,0), ncol=10)
D2 <- abs(matrix(rep(S,10), byrow = FALSE, ncol= 10) -
            matrix(rep(REC,10), byrow = TRUE, ncol= 10))
R <- D1*t(D1)
Y <- matrix(c(0,1,1,1,1,1,0,0,1,1,
              0,0,0,1,1,1,0,0,1,0,
              1,1,0,1,1,1,0,0,1,1,
              1,1,1,0,1,1,0,1,1,0,
              1,1,1,1,0,1,1,0,1,1,
              0,1,1,1,1,0,1,1,1,0,
              1,0,1,0,1,1,0,1,0,1,
              0,1,1,1,0,1,1,0,1,1,
              1,0,1,0,1,0,1,1,0,1,
              1,1,1,0,0,1,1,1,1,0), ncol=10) 

# estimate p2 model
p2(Y,sender= ~ S, receiver =  ~ REC, density = ~ D1 + D2, reciprocity= ~ R,
   burnin = 1000, sample = 4000, adapt = 20)
# Notice: burn-in, sample size and number of adaptive sequenses are 
# much smaller than recommended to keep computation time low.
# recommended code: 
## No test: 
p2(Y,sender= ~ S, receiver =  ~ REC, density = ~ D1+ D2, reciprocity= ~ R)
## End(No test)



