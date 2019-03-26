library(BayesLCA)


### Name: plot.blca
### Title: Plot Parameter Summaries, Density Estimates and Model
###   Diagnostics for Bayesian Latent Class Analysis
### Aliases: plot.blca plot.blca.boot plot.blca.em plot.blca.gibbs
###   plot.blca.vb
### Keywords: blca plot

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))

fit <- blca.em(x, 2)
plot(fit, which = 1:2) ## Parameter summary and classification uncertainty plots.

palette(rainbow(6)) ## Change color scheme
plot(fit, which = 2) 
palette("default") ## Restore default color scheme

fit2<- blca.vb(x,2)
par(mfrow = c(3,4))
plot(fit2, which = 3) ## Approximate density plots for item probability parameters.
par(mfrow = c(1,1))



