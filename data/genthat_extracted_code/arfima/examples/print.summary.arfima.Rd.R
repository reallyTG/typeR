library(arfima)


### Name: print.summary.arfima
### Title: Prints the output of a call to 'summary' on an 'arfima' object
### Aliases: print.summary.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(54678)
sim <- arfima.sim(1000, model = list(phi = 0.9, H = 0.3))
fit <- arfima(sim, order = c(1, 0, 0), lmodel = "g", back=TRUE)
summary(fit)
## End(No test)




