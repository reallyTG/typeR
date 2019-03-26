library(ineq)


### Name: plot.Lc
### Title: Plot Lorenz Curve
### Aliases: plot.Lc lines.Lc
### Keywords: hplot

### ** Examples

## Load and attach income (and metadata) set from Ilocos, Philippines
data(Ilocos)
attach(Ilocos)
## extract and rescale income for the provinces "Pangasinan" und "La Union"
income.p <- income[province=="Pangasinan"]/10000
income.u <- income[province=="La Union"]/10000
## compute the Lorenz curves
Lc.p <- Lc(income.p)
Lc.u <- Lc(income.u)
## plot both Lorenz curves
plot(Lc.p)
lines(Lc.u, col=2)



