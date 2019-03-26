library(EMMAgeo)


### Name: Mqs.uncertainty
### Title: Function to estimate end-member scores uncertainty
### Aliases: Mqs.uncertainty
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## set model run parameters
q = 3 # set number of end-members, try 4 to see the difference!
Vqn <- EMMA(X, q)$Vqn # assign unscaled end-member loadings
Vqn.sd <- Vqn * 0.2 # assign a relative standard deviation of 20 %
l.1 <- 0.2 # set l to 0.2
l.2 <- c(0.2, 0.08) # set l to mean = 0.2 and sd = 0.08
runs <-  12 # senseless value to increase computation speed

## EXAMPLE 1
## Calculate Mqs uncertainty
M <- Mqs.uncertainty(X = X,
                     q = q,
                     l = l.1,
                     runs = runs,
                     Vqn = Vqn,
                     Vqn.sd = Vqn.sd,
                     type.l = "rnorm",
                     autocorrelation = 3)

## Plot line-point graph with means and standard deviations
plot(NA,
     xlim = c(1, nrow(X)),
     ylim = c(0.5, q + 1),
     main = "End-member scores with uncertainty")
for(i in 1:q) {
  lines(1:nrow(X), M$mean[,i] - M$sd[,i] + i, col = i, lty = 2)
  lines(1:nrow(X), M$mean[,i] + i, col = i, lwd = 2)
  points(1:nrow(X), M$mean[,i] + i, col = i)
  lines(1:nrow(X), M$mean[,i] + M$sd[,i] + i, col = i, lty = 2)
}

## EXAMPLE 2
## Calculate Mqs uncertainty
M <- Mqs.uncertainty(X = X,
                     q = q,
                     l = l.2,
                     runs = runs,
                     Vqn = Vqn,
                     type.l = "rnorm")

## Plot point graph with error bars
plot(NA,
     xlim = c(1, nrow(X)),
     ylim = c(0.5, q + 1),
     main = "End-member scores with uncertainty")
for(i in 1:q) {
  points(1:nrow(X), M$mean[,i] + i, pch = 3, col = i)
  arrows(1:nrow(X), M$mean[,i] - M$sd[,i] + i,
         1:nrow(X), M$mean[,i] + M$sd[,i] + i,
         code = 3, angle = 90, length = 0.05, col = i)
}



