library(Renext)


### Name: fweibull
### Title: ML estimation of classical Weibull distribution
### Aliases: fweibull

### ** Examples


n <- 1000
set.seed(1234)
shape <- 2 * runif(1)
x <- 100 * rweibull(n, shape = 0.8, scale = 1)
res <- fweibull(x)

## compare with MASS
if (require(MASS)) {
   res2 <- fitdistr(x , "weibull")
   est <- cbind(res$estimate, res2$estimate)
   colnames(est) <- c("Renext", "MASS")
   loglik <- c(res$loglik, res2$loglik)
   est <- rbind(est, loglik)
   est
}

## Weibull plot
weibplot(x,
         shape = c(res$estimate["shape"], res2$estimate["shape"]),
         scale = c(res$estimate["scale"], res2$estimate["scale"]),
         labels = c("Renext 'fweibull'", "MASS 'fitdistr'"),
         mono = TRUE)



