library(TRES)


### Name: ballGBB1D_bic
### Title: Envelope dimension selection based on 1D-BIC
### Aliases: ballGBB1D_bic

### ** Examples


##simulate two matrices M and U with an envelope structure#
data <- MenvU_sim(n=200, p=20, u=5)
Mhat <- data$Mhat
Uhat <- data$Uhat

res <- ballGBB1D_bic(Mhat, Uhat, n=200)

## visualization
plot(1:10, res$bicval, type="o", xlab="Envelope Dimension", ylab="BIC values",
main="Envelope Dimension Selection")



