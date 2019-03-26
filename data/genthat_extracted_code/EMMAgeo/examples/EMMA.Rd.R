library(EMMAgeo)


### Name: EMMA
### Title: Function for end-member modelling analysis.
### Aliases: EMMA
### Keywords: EMMA

### ** Examples

## load example data and set phi-vector
data(X, envir = environment())
phi <- seq(from = 1, to = 10, length.out = ncol(X))

## perform EMMA with 5 end-members
EM <- EMMA(X = X, q = 5, l = 0.05, c = 100, plot = TRUE)

## perform EMMA with 4 end-members and more graphical settings
EM <- EMMA(X = X, q = 4, l = 0.05, c = 100,
           plot = TRUE,
           EM.ID = c("EM 1", "EM 2", "EM 3", "EM 4"),
           classunits = phi,
           xlab = c(expression(paste("Class [", phi, "]")), "Sample ID"),
           cex = 0.7,
           col = colors()[c(441, 496, 499, 506)])



