library(POT)


### Name: plot.uvpot
### Title: Graphical Diagnostic: the Univariate GPD Model
### Aliases: plot.uvpot
### Keywords: hplot

### ** Examples

data(ardieres)
ardieres <- clust(ardieres, 4, 10 / 365, clust.max = TRUE)
fitted <- fitgpd(ardieres[, "obs"], 6, 'mle')
npy <- fitted$nat / 33.4 ##33.4 is the total record length (in year)
par(mfrow=c(2,2))
plot(fitted, npy = npy)



