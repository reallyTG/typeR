library(hyper2)


### Name: loglik
### Title: Log likelihood functions
### Aliases: loglik like_single_list like_series

### ** Examples

data(chess)
loglik(chess,c(1/3,1/3))

data(masterchef)

a1 <- rep(1/13,12)                          # equal strengths
a2 <- indep(pmax_masterchef6)               # MLE

like_series(a1,masterchef_series6)
like_series(a2,masterchef_series6)


W <- hyper2(pnames=letters[1:6])
W1 <- ggol(W, 'a', letters[2:5],'f')              # 24-element list
W2 <- ggol(W, c('a','b'), c('c','d'),c('e','f'))  # 2^3=8 element list

like_single_list(rep(1/6,5),W1)      # information from first observation
like_series(rep(1/6,5),list(W1,W2))  # information from both observations





