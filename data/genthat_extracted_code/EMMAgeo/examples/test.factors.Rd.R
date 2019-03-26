library(EMMAgeo)


### Name: test.factors
### Title: Function to evaluate the initial cumulative explained variance.
### Aliases: test.factors
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## create sequence of weight transformation limits
l <- seq(from = 0, to = 0.2, 0.02)

## perform the test and show q.min
L <- test.factors(X = X, l = l, c = 100, plot = TRUE)
L$q.min

## a visualisation with more plot parameters
L <- test.factors(X = X, l = l, c = 100, plot = TRUE,
                  ylim = c(0.5, 1), xlim = c(1, 7),
                  legend = "bottomright", cex = 0.7)

## another visualisation, a close-up
plot(1:7, L$L[1,1:7], type = "l",
     xlab = "q", ylab = "Explained variance")
for(i in 2:7) {lines(1:7, L$L[i,1:7], col = i)}



