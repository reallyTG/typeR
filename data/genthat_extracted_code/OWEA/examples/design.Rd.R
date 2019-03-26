library(OWEA)


### Name: design
### Title: Design Generator for Three Models
### Aliases: design

### ** Examples

# NOTE: max_iter is usually set to 40. 
# Here max_iter = 5 is for demenstration only.
# crossover dropout model
## D-optimal

example1 <- design('dropout',10,0,3,3,drop=c(0,0,0.5), max_iter = 5)
summary(example1)
eff(example1) # efficiency from rounding
effLB(example1) # obtain lower bound of efficiency

## A-optimal
design('dropout',10,1,3,3,drop=c(0,0,0.5), max_iter = 5)


# proportional model
## D-optimal
design('proportional',10,0,3,3, sigma = diag(1,3),tau = matrix(sqrt(1+3),
    nrow=3, ncol=1),lambda = 0.2, max_iter = 5)

## A-optimal
design('proportional',10,1,3,3, sigma = diag(1,3), tau = matrix(sqrt(1+3),
    nrow=3, ncol=1),lambda = 0.2, max_iter = 5)


# interference model
## D-optimal
design('interference',10,0,3,3, sigma = diag(1,3), max_iter = 5)

## A-optimal
design('interference',10,1,3,3, sigma = diag(1,3), max_iter = 5)




