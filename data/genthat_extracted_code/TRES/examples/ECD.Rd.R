library(TRES)


### Name: ECD
### Title: ECD algorithm for estimating the envelope subspace
### Aliases: ECD

### ** Examples


##simulate two matrices M and U with an envelope structure#
data <- MenvU_sim(n=200, p=20, u=5)
Mhat <- data$Mhat
Uhat <- data$Uhat

Ghat_ECD <- ECD(Mhat, Uhat, u=5)



