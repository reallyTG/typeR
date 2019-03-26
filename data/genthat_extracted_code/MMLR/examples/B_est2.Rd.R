library(MMLR)


### Name: B_est2
### Title: Estimantion of unknown Markov-modulated linear regression model
###   parameters using GLSM
### Aliases: B_est2

### ** Examples


lambda <- matrix(c(0, 0.33, 0.45, 0), nrow = 2, ncol = 2, byrow = TRUE)
X <- cbind(rep_len(1,10),c(2,5,7,3,1,1,2,2,3,6), c(5,9,1,2,3,2,3,5,2,2))
tGiven <- matrix (c(6,4.8,1,2.6,6.4,1.7,2.9,4.4,1.5,3.4), nrow = 10, ncol = 1)
Y <- matrix(c (5.7, 9.9, 7.8, 14.5, 8.2, 14.5, 32.2, 3.8, 16.5, 7.7),nrow = 10, ncol = 1)
initState <- matrix (c(2,1,1,2,2,2,1,1,2,1),nrow = 10, ncol = 1)
B_est2(tGiven,initState,X,Y,lambda,W = 1)



