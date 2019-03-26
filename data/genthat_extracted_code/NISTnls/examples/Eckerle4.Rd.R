library(NISTnls)


### Name: Eckerle4
### Title: Circular interference data
### Aliases: Eckerle4
### Keywords: datasets

### ** Examples

Try <- function(expr) if (!inherits(val <- try(expr), "try-error")) val
plot(y ~ x, data = Eckerle4)
## should fail - ridiculous starting value for b3
Try(fm1 <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2), Eckerle4,
               trace = TRUE,
               start = c(b1 = 1, b2 = 10, b3 = 500)))
Try(fm1a <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2), Eckerle4,
                  trace = TRUE, alg = "port",
                  start = c(b1 = 1, b2 = 10, b3 = 500)))
Try(fm2 <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2),
            Eckerle4, trace = TRUE,
            start = c(b1 = 1.5, b2 = 5, b3 = 450)))
Try(fm2a <- nls(y ~ (b1/b2) * exp(-0.5*((x-b3)/b2)**2),
            Eckerle4, trace = TRUE, alg = "port",
            start = c(b1 = 1.5, b2 = 5, b3 = 450)))
## should fail - ridiculous starting value for b3
Try(fm3 <- nls(y ~ (1/b2) * exp(-0.5*((x-b3)/b2)**2),
               Eckerle4, trace = TRUE,
               start = c(b2 = 10, b3 = 500), algorithm = "plinear"))
Try(fm4 <- nls(y ~ (1/b2) * exp(-0.5*((x-b3)/b2)**2), Eckerle4, trace = TRUE,
           start = c(b2 = 5, b3 = 450), algorithm = "plinear"))



