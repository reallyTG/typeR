library(expert)


### Name: expert
### Title: Modeling of Data Using Expert Opinion
### Aliases: expert print.expert summary.expert print.summary.expert
### Keywords: distribution models

### ** Examples

## An example with three experts (E1, E2, E3), two seed variables
## (A1, A2) and three quantiles (10th, 50th and 90th).
x <- list(E1 <- list(A1 <- c(0.14, 0.22, 0.28),
                     A2 <- c(130000, 150000, 200000),
                     X <- c(350000, 400000, 525000)),
          E2 <- list(A1 <- c(0.2, 0.3, 0.4),
                     A2 <- c(165000, 205000, 250000),
                     X <- c(550000, 600000, 650000)),
          E3 <- list(A1 <- c(0.2, 0.4, 0.52),
                     A2 <- c(200000, 400000, 500000),
                     X <- c(625000, 700000, 800000)))
probs <- c(0.1, 0.5, 0.9)
true.seed <- c(0.27, 210000)

## Cooke model
expert(x, "cooke", probs, true.seed, alpha = 0.03) # fixed alpha
expert(x, "cooke", probs, true.seed)               # optimized alpha

## Mendel-Sheridan model
fit <- expert(x, "ms", probs, true.seed)
fit				# print method
summary(fit)                    # more information

## Predefined weights model
expert(x, "weights", probs, true.seed)             # equal weights
expert(x, "weights", probs, true.seed, w = c(0.25, 0.5, 0.25))



