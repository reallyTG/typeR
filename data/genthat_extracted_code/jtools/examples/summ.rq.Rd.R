library(jtools)


### Name: summ.rq
### Title: Quantile regression summaries with options
### Aliases: summ.rq

### ** Examples


if (requireNamespace("quantreg")) {
 library(quantreg)
 data(engel)
 fitrq <- rq(income ~ foodexp, data = engel, tau = 0.5)
 summ(fitrq)
}





