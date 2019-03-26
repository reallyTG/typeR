library(FunChisq)


### Name: plot_table
### Title: Plot a contingency table
### Aliases: plot_table
### Keywords: hplot

### ** Examples

opar <- par(mfrow=c(2,2))
plot_table(matrix(1:6, nrow=2), col="seagreen2")

plot_table(matrix(rnorm(20), nrow=5), col="orange", show.value=FALSE)

plot_table(matrix(rpois(16, 2), nrow=4), col="cornflowerblue", highlight="none")

plot_table(matrix(rbinom(15, 8, 0.5), nrow=3), col="sienna2", highlight="none")
par(opar)



