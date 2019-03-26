library(dyads)


### Name: j2
### Title: MCMC estimates for the j2 model
### Aliases: j2
### Keywords: p2 model

### ** Examples


# create a very small network with covariates for illustrative purposes
S <- c(1,0,1,0,1,1,0,1,0,1)
REC <- c(0,0,1,1,0,0,1,1,0,0)
D1 <- matrix(c(0,1,0,1,0,1,0,1,0,0,
               0,0,1,1,0,1,0,1,0,1,
               1,1,0,0,1,0,0,0,0,0,
               1,1,1,0,1,0,0,0,0,1,
               1,0,1,0,0,1,1,0,1,1,
               0,0,0,0,0,0,1,1,1,1,
               0,0,0,0,0,1,0,1,0,1,
               1,0,0,0,0,1,1,0,1,1,
               0,1,0,1,0,1,0,1,0,0,
               0,0,1,1,1,0,0,0,0,0), ncol=10)
D2 <- abs(matrix(rep(S,10), byrow = FALSE, ncol= 10) -
            matrix(rep(REC,10), byrow = TRUE, ncol= 10))
R <- D1*t(D1)
Y <- matrix(c(0,0,1,1,1,1,0,0,1,1,
              0,0,0,1,1,1,0,0,1,0,
              1,1,0,1,1,1,0,0,1,1,
              0,1,1,0,1,1,0,1,1,0,
              1,1,1,1,0,1,1,0,1,1,
              0,1,1,1,1,0,1,1,1,0,
              1,0,1,0,1,1,0,1,0,1,
              0,1,1,1,0,1,1,0,1,1,
              1,0,1,0,1,0,1,1,0,1,
              1,1,1,0,0,1,1,1,1,0), ncol=10) 

# estimate j2 model
j2(Y,sender= ~ S, receiver =  ~ REC, density = ~ D1 + D2, reciprocity= ~ R,
   burnin = 1000, sample = 4000, adapt = 20)
# notice: burn-in, sample size and number of adaptive sequenses are 
# much smaller than recommended to keep computation time low.
# recommended code: 
## No test: 
j2(Y,sender= ~ S, receiver =  ~ REC, density = ~ D1 + D2, reciprocity= ~ R)
## End(No test)



